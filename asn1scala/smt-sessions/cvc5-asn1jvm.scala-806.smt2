; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23450 () Bool)

(assert start!23450)

(declare-fun b!119029 () Bool)

(declare-fun res!98516 () Bool)

(declare-fun e!78018 () Bool)

(assert (=> b!119029 (=> (not res!98516) (not e!78018))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!119029 (= res!98516 (bvslt i!615 nBits!396))))

(declare-fun b!119030 () Bool)

(declare-fun e!78016 () Bool)

(declare-datatypes ((array!5330 0))(
  ( (array!5331 (arr!3009 (Array (_ BitVec 32) (_ BitVec 8))) (size!2416 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4306 0))(
  ( (BitStream!4307 (buf!2838 array!5330) (currentByte!5499 (_ BitVec 32)) (currentBit!5494 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9976 0))(
  ( (tuple2!9977 (_1!5253 BitStream!4306) (_2!5253 Bool)) )
))
(declare-fun lt!183670 () tuple2!9976)

(declare-fun lt!183677 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119030 (= e!78016 (= (bitIndex!0 (size!2416 (buf!2838 (_1!5253 lt!183670))) (currentByte!5499 (_1!5253 lt!183670)) (currentBit!5494 (_1!5253 lt!183670))) lt!183677))))

(declare-fun b!119031 () Bool)

(declare-fun e!78012 () Bool)

(declare-fun thiss!1305 () BitStream!4306)

(declare-fun array_inv!2218 (array!5330) Bool)

(assert (=> b!119031 (= e!78012 (array_inv!2218 (buf!2838 thiss!1305)))))

(declare-fun b!119032 () Bool)

(declare-fun e!78014 () Bool)

(declare-fun e!78015 () Bool)

(assert (=> b!119032 (= e!78014 e!78015)))

(declare-fun res!98525 () Bool)

(assert (=> b!119032 (=> (not res!98525) (not e!78015))))

(declare-fun lt!183682 () (_ BitVec 64))

(assert (=> b!119032 (= res!98525 (= lt!183677 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!183682)))))

(declare-datatypes ((Unit!7327 0))(
  ( (Unit!7328) )
))
(declare-datatypes ((tuple2!9978 0))(
  ( (tuple2!9979 (_1!5254 Unit!7327) (_2!5254 BitStream!4306)) )
))
(declare-fun lt!183685 () tuple2!9978)

(assert (=> b!119032 (= lt!183677 (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183685))) (currentByte!5499 (_2!5254 lt!183685)) (currentBit!5494 (_2!5254 lt!183685))))))

(assert (=> b!119032 (= lt!183682 (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)))))

(declare-fun b!119033 () Bool)

(assert (=> b!119033 (= e!78015 e!78016)))

(declare-fun res!98520 () Bool)

(assert (=> b!119033 (=> (not res!98520) (not e!78016))))

(declare-fun lt!183686 () Bool)

(assert (=> b!119033 (= res!98520 (and (= (_2!5253 lt!183670) lt!183686) (= (_1!5253 lt!183670) (_2!5254 lt!183685))))))

(declare-fun readBitPure!0 (BitStream!4306) tuple2!9976)

(declare-fun readerFrom!0 (BitStream!4306 (_ BitVec 32) (_ BitVec 32)) BitStream!4306)

(assert (=> b!119033 (= lt!183670 (readBitPure!0 (readerFrom!0 (_2!5254 lt!183685) (currentBit!5494 thiss!1305) (currentByte!5499 thiss!1305))))))

(declare-fun b!119034 () Bool)

(declare-fun e!78011 () Bool)

(declare-fun lt!183675 () tuple2!9976)

(declare-fun lt!183672 () tuple2!9976)

(assert (=> b!119034 (= e!78011 (= (_2!5253 lt!183675) (_2!5253 lt!183672)))))

(declare-fun res!98518 () Bool)

(declare-fun e!78010 () Bool)

(assert (=> start!23450 (=> (not res!98518) (not e!78010))))

(assert (=> start!23450 (= res!98518 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23450 e!78010))

(assert (=> start!23450 true))

(declare-fun inv!12 (BitStream!4306) Bool)

(assert (=> start!23450 (and (inv!12 thiss!1305) e!78012)))

(declare-fun b!119035 () Bool)

(assert (=> b!119035 (= e!78010 e!78018)))

(declare-fun res!98523 () Bool)

(assert (=> b!119035 (=> (not res!98523) (not e!78018))))

(declare-fun lt!183692 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119035 (= res!98523 (validate_offset_bits!1 ((_ sign_extend 32) (size!2416 (buf!2838 thiss!1305))) ((_ sign_extend 32) (currentByte!5499 thiss!1305)) ((_ sign_extend 32) (currentBit!5494 thiss!1305)) lt!183692))))

(assert (=> b!119035 (= lt!183692 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun lt!183674 () tuple2!9978)

(declare-fun b!119036 () Bool)

(declare-fun e!78009 () Bool)

(declare-datatypes ((tuple2!9980 0))(
  ( (tuple2!9981 (_1!5255 BitStream!4306) (_2!5255 BitStream!4306)) )
))
(declare-fun lt!183689 () tuple2!9980)

(declare-fun withMovedBitIndex!0 (BitStream!4306 (_ BitVec 64)) BitStream!4306)

(assert (=> b!119036 (= e!78009 (= (_1!5255 lt!183689) (withMovedBitIndex!0 (_2!5255 lt!183689) (bvsub (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)) (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183674))) (currentByte!5499 (_2!5254 lt!183674)) (currentBit!5494 (_2!5254 lt!183674)))))))))

(declare-datatypes ((tuple2!9982 0))(
  ( (tuple2!9983 (_1!5256 BitStream!4306) (_2!5256 (_ BitVec 64))) )
))
(declare-fun lt!183678 () tuple2!9982)

(declare-fun lt!183673 () tuple2!9982)

(assert (=> b!119036 (and (= (_2!5256 lt!183678) (_2!5256 lt!183673)) (= (_1!5256 lt!183678) (_1!5256 lt!183673)))))

(declare-fun lt!183690 () (_ BitVec 64))

(declare-fun lt!183676 () Unit!7327)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7327)

(assert (=> b!119036 (= lt!183676 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5255 lt!183689) nBits!396 i!615 lt!183690))))

(declare-fun lt!183671 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9982)

(assert (=> b!119036 (= lt!183673 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5255 lt!183689) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183671))))

(declare-fun b!119037 () Bool)

(assert (=> b!119037 (= e!78018 (not e!78009))))

(declare-fun res!98515 () Bool)

(assert (=> b!119037 (=> res!98515 e!78009)))

(declare-fun lt!183679 () tuple2!9980)

(assert (=> b!119037 (= res!98515 (not (= (_1!5256 (readNLeastSignificantBitsLoopPure!0 (_1!5255 lt!183679) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183671)) (_2!5255 lt!183679))))))

(declare-fun lt!183693 () (_ BitVec 64))

(assert (=> b!119037 (validate_offset_bits!1 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183674)))) ((_ sign_extend 32) (currentByte!5499 (_2!5254 lt!183685))) ((_ sign_extend 32) (currentBit!5494 (_2!5254 lt!183685))) lt!183693)))

(declare-fun lt!183681 () Unit!7327)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4306 array!5330 (_ BitVec 64)) Unit!7327)

(assert (=> b!119037 (= lt!183681 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5254 lt!183685) (buf!2838 (_2!5254 lt!183674)) lt!183693))))

(assert (=> b!119037 (= lt!183693 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!183687 () tuple2!9976)

(declare-fun lt!183688 () (_ BitVec 64))

(assert (=> b!119037 (= lt!183671 (bvor lt!183690 (ite (_2!5253 lt!183687) lt!183688 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119037 (= lt!183678 (readNLeastSignificantBitsLoopPure!0 (_1!5255 lt!183689) nBits!396 i!615 lt!183690))))

(assert (=> b!119037 (validate_offset_bits!1 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183674)))) ((_ sign_extend 32) (currentByte!5499 thiss!1305)) ((_ sign_extend 32) (currentBit!5494 thiss!1305)) lt!183692)))

(declare-fun lt!183683 () Unit!7327)

(assert (=> b!119037 (= lt!183683 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2838 (_2!5254 lt!183674)) lt!183692))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119037 (= lt!183690 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!119037 (= (_2!5253 lt!183687) lt!183686)))

(assert (=> b!119037 (= lt!183687 (readBitPure!0 (_1!5255 lt!183689)))))

(declare-fun reader!0 (BitStream!4306 BitStream!4306) tuple2!9980)

(assert (=> b!119037 (= lt!183679 (reader!0 (_2!5254 lt!183685) (_2!5254 lt!183674)))))

(assert (=> b!119037 (= lt!183689 (reader!0 thiss!1305 (_2!5254 lt!183674)))))

(assert (=> b!119037 e!78011))

(declare-fun res!98517 () Bool)

(assert (=> b!119037 (=> (not res!98517) (not e!78011))))

(assert (=> b!119037 (= res!98517 (= (bitIndex!0 (size!2416 (buf!2838 (_1!5253 lt!183675))) (currentByte!5499 (_1!5253 lt!183675)) (currentBit!5494 (_1!5253 lt!183675))) (bitIndex!0 (size!2416 (buf!2838 (_1!5253 lt!183672))) (currentByte!5499 (_1!5253 lt!183672)) (currentBit!5494 (_1!5253 lt!183672)))))))

(declare-fun lt!183680 () Unit!7327)

(declare-fun lt!183684 () BitStream!4306)

(declare-fun readBitPrefixLemma!0 (BitStream!4306 BitStream!4306) Unit!7327)

(assert (=> b!119037 (= lt!183680 (readBitPrefixLemma!0 lt!183684 (_2!5254 lt!183674)))))

(assert (=> b!119037 (= lt!183672 (readBitPure!0 (BitStream!4307 (buf!2838 (_2!5254 lt!183674)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305))))))

(assert (=> b!119037 (= lt!183675 (readBitPure!0 lt!183684))))

(assert (=> b!119037 (= lt!183684 (BitStream!4307 (buf!2838 (_2!5254 lt!183685)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)))))

(declare-fun e!78013 () Bool)

(assert (=> b!119037 e!78013))

(declare-fun res!98522 () Bool)

(assert (=> b!119037 (=> (not res!98522) (not e!78013))))

(declare-fun isPrefixOf!0 (BitStream!4306 BitStream!4306) Bool)

(assert (=> b!119037 (= res!98522 (isPrefixOf!0 thiss!1305 (_2!5254 lt!183674)))))

(declare-fun lt!183691 () Unit!7327)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4306 BitStream!4306 BitStream!4306) Unit!7327)

(assert (=> b!119037 (= lt!183691 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5254 lt!183685) (_2!5254 lt!183674)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4306 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9978)

(assert (=> b!119037 (= lt!183674 (appendNLeastSignificantBitsLoop!0 (_2!5254 lt!183685) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!119037 e!78014))

(declare-fun res!98526 () Bool)

(assert (=> b!119037 (=> (not res!98526) (not e!78014))))

(assert (=> b!119037 (= res!98526 (= (size!2416 (buf!2838 thiss!1305)) (size!2416 (buf!2838 (_2!5254 lt!183685)))))))

(declare-fun appendBit!0 (BitStream!4306 Bool) tuple2!9978)

(assert (=> b!119037 (= lt!183685 (appendBit!0 thiss!1305 lt!183686))))

(assert (=> b!119037 (= lt!183686 (not (= (bvand v!199 lt!183688) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119037 (= lt!183688 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!119038 () Bool)

(declare-fun res!98524 () Bool)

(assert (=> b!119038 (=> (not res!98524) (not e!78015))))

(assert (=> b!119038 (= res!98524 (isPrefixOf!0 thiss!1305 (_2!5254 lt!183685)))))

(declare-fun b!119039 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!119039 (= e!78013 (invariant!0 (currentBit!5494 thiss!1305) (currentByte!5499 thiss!1305) (size!2416 (buf!2838 (_2!5254 lt!183674)))))))

(declare-fun b!119040 () Bool)

(declare-fun res!98521 () Bool)

(assert (=> b!119040 (=> (not res!98521) (not e!78013))))

(assert (=> b!119040 (= res!98521 (invariant!0 (currentBit!5494 thiss!1305) (currentByte!5499 thiss!1305) (size!2416 (buf!2838 (_2!5254 lt!183685)))))))

(declare-fun b!119041 () Bool)

(declare-fun res!98519 () Bool)

(assert (=> b!119041 (=> (not res!98519) (not e!78018))))

(assert (=> b!119041 (= res!98519 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!23450 res!98518) b!119035))

(assert (= (and b!119035 res!98523) b!119041))

(assert (= (and b!119041 res!98519) b!119029))

(assert (= (and b!119029 res!98516) b!119037))

(assert (= (and b!119037 res!98526) b!119032))

(assert (= (and b!119032 res!98525) b!119038))

(assert (= (and b!119038 res!98524) b!119033))

(assert (= (and b!119033 res!98520) b!119030))

(assert (= (and b!119037 res!98522) b!119040))

(assert (= (and b!119040 res!98521) b!119039))

(assert (= (and b!119037 res!98517) b!119034))

(assert (= (and b!119037 (not res!98515)) b!119036))

(assert (= start!23450 b!119031))

(declare-fun m!179051 () Bool)

(assert (=> b!119037 m!179051))

(declare-fun m!179053 () Bool)

(assert (=> b!119037 m!179053))

(declare-fun m!179055 () Bool)

(assert (=> b!119037 m!179055))

(declare-fun m!179057 () Bool)

(assert (=> b!119037 m!179057))

(declare-fun m!179059 () Bool)

(assert (=> b!119037 m!179059))

(declare-fun m!179061 () Bool)

(assert (=> b!119037 m!179061))

(declare-fun m!179063 () Bool)

(assert (=> b!119037 m!179063))

(declare-fun m!179065 () Bool)

(assert (=> b!119037 m!179065))

(declare-fun m!179067 () Bool)

(assert (=> b!119037 m!179067))

(declare-fun m!179069 () Bool)

(assert (=> b!119037 m!179069))

(declare-fun m!179071 () Bool)

(assert (=> b!119037 m!179071))

(declare-fun m!179073 () Bool)

(assert (=> b!119037 m!179073))

(declare-fun m!179075 () Bool)

(assert (=> b!119037 m!179075))

(declare-fun m!179077 () Bool)

(assert (=> b!119037 m!179077))

(declare-fun m!179079 () Bool)

(assert (=> b!119037 m!179079))

(declare-fun m!179081 () Bool)

(assert (=> b!119037 m!179081))

(declare-fun m!179083 () Bool)

(assert (=> b!119037 m!179083))

(declare-fun m!179085 () Bool)

(assert (=> b!119037 m!179085))

(declare-fun m!179087 () Bool)

(assert (=> b!119037 m!179087))

(declare-fun m!179089 () Bool)

(assert (=> start!23450 m!179089))

(declare-fun m!179091 () Bool)

(assert (=> b!119039 m!179091))

(declare-fun m!179093 () Bool)

(assert (=> b!119040 m!179093))

(declare-fun m!179095 () Bool)

(assert (=> b!119036 m!179095))

(declare-fun m!179097 () Bool)

(assert (=> b!119036 m!179097))

(declare-fun m!179099 () Bool)

(assert (=> b!119036 m!179099))

(assert (=> b!119036 m!179099))

(declare-fun m!179101 () Bool)

(assert (=> b!119036 m!179101))

(declare-fun m!179103 () Bool)

(assert (=> b!119036 m!179103))

(declare-fun m!179105 () Bool)

(assert (=> b!119036 m!179105))

(declare-fun m!179107 () Bool)

(assert (=> b!119030 m!179107))

(declare-fun m!179109 () Bool)

(assert (=> b!119032 m!179109))

(assert (=> b!119032 m!179097))

(declare-fun m!179111 () Bool)

(assert (=> b!119035 m!179111))

(declare-fun m!179113 () Bool)

(assert (=> b!119038 m!179113))

(declare-fun m!179115 () Bool)

(assert (=> b!119031 m!179115))

(declare-fun m!179117 () Bool)

(assert (=> b!119041 m!179117))

(declare-fun m!179119 () Bool)

(assert (=> b!119033 m!179119))

(assert (=> b!119033 m!179119))

(declare-fun m!179121 () Bool)

(assert (=> b!119033 m!179121))

(push 1)

(assert (not start!23450))

(assert (not b!119031))

(assert (not b!119033))

(assert (not b!119041))

(assert (not b!119030))

(assert (not b!119040))

(assert (not b!119036))

(assert (not b!119037))

(assert (not b!119039))

(assert (not b!119038))

(assert (not b!119035))

(assert (not b!119032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!38114 () Bool)

(declare-fun res!98606 () Bool)

(declare-fun e!78083 () Bool)

(assert (=> d!38114 (=> (not res!98606) (not e!78083))))

(assert (=> d!38114 (= res!98606 (= (size!2416 (buf!2838 thiss!1305)) (size!2416 (buf!2838 (_2!5254 lt!183685)))))))

(assert (=> d!38114 (= (isPrefixOf!0 thiss!1305 (_2!5254 lt!183685)) e!78083)))

(declare-fun b!119126 () Bool)

(declare-fun res!98607 () Bool)

(assert (=> b!119126 (=> (not res!98607) (not e!78083))))

(assert (=> b!119126 (= res!98607 (bvsle (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)) (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183685))) (currentByte!5499 (_2!5254 lt!183685)) (currentBit!5494 (_2!5254 lt!183685)))))))

(declare-fun b!119127 () Bool)

(declare-fun e!78084 () Bool)

(assert (=> b!119127 (= e!78083 e!78084)))

(declare-fun res!98605 () Bool)

(assert (=> b!119127 (=> res!98605 e!78084)))

(assert (=> b!119127 (= res!98605 (= (size!2416 (buf!2838 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!119128 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5330 array!5330 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119128 (= e!78084 (arrayBitRangesEq!0 (buf!2838 thiss!1305) (buf!2838 (_2!5254 lt!183685)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305))))))

(assert (= (and d!38114 res!98606) b!119126))

(assert (= (and b!119126 res!98607) b!119127))

(assert (= (and b!119127 (not res!98605)) b!119128))

(assert (=> b!119126 m!179097))

(assert (=> b!119126 m!179109))

(assert (=> b!119128 m!179097))

(assert (=> b!119128 m!179097))

(declare-fun m!179267 () Bool)

(assert (=> b!119128 m!179267))

(assert (=> b!119038 d!38114))

(declare-fun d!38116 () Bool)

(assert (=> d!38116 (= (invariant!0 (currentBit!5494 thiss!1305) (currentByte!5499 thiss!1305) (size!2416 (buf!2838 (_2!5254 lt!183674)))) (and (bvsge (currentBit!5494 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5494 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5499 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5499 thiss!1305) (size!2416 (buf!2838 (_2!5254 lt!183674)))) (and (= (currentBit!5494 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5499 thiss!1305) (size!2416 (buf!2838 (_2!5254 lt!183674))))))))))

(assert (=> b!119039 d!38116))

(declare-fun d!38118 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!38118 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2416 (buf!2838 thiss!1305))) ((_ sign_extend 32) (currentByte!5499 thiss!1305)) ((_ sign_extend 32) (currentBit!5494 thiss!1305)) lt!183692) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2416 (buf!2838 thiss!1305))) ((_ sign_extend 32) (currentByte!5499 thiss!1305)) ((_ sign_extend 32) (currentBit!5494 thiss!1305))) lt!183692))))

(declare-fun bs!9227 () Bool)

(assert (= bs!9227 d!38118))

(declare-fun m!179269 () Bool)

(assert (=> bs!9227 m!179269))

(assert (=> b!119035 d!38118))

(declare-fun d!38120 () Bool)

(assert (=> d!38120 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!119037 d!38120))

(declare-fun d!38122 () Bool)

(declare-fun e!78087 () Bool)

(assert (=> d!38122 e!78087))

(declare-fun res!98610 () Bool)

(assert (=> d!38122 (=> (not res!98610) (not e!78087))))

(declare-fun lt!183847 () tuple2!9976)

(declare-fun lt!183849 () tuple2!9976)

(assert (=> d!38122 (= res!98610 (= (bitIndex!0 (size!2416 (buf!2838 (_1!5253 lt!183847))) (currentByte!5499 (_1!5253 lt!183847)) (currentBit!5494 (_1!5253 lt!183847))) (bitIndex!0 (size!2416 (buf!2838 (_1!5253 lt!183849))) (currentByte!5499 (_1!5253 lt!183849)) (currentBit!5494 (_1!5253 lt!183849)))))))

(declare-fun lt!183848 () BitStream!4306)

(declare-fun lt!183846 () Unit!7327)

(declare-fun choose!50 (BitStream!4306 BitStream!4306 BitStream!4306 tuple2!9976 tuple2!9976 BitStream!4306 Bool tuple2!9976 tuple2!9976 BitStream!4306 Bool) Unit!7327)

(assert (=> d!38122 (= lt!183846 (choose!50 lt!183684 (_2!5254 lt!183674) lt!183848 lt!183847 (tuple2!9977 (_1!5253 lt!183847) (_2!5253 lt!183847)) (_1!5253 lt!183847) (_2!5253 lt!183847) lt!183849 (tuple2!9977 (_1!5253 lt!183849) (_2!5253 lt!183849)) (_1!5253 lt!183849) (_2!5253 lt!183849)))))

(assert (=> d!38122 (= lt!183849 (readBitPure!0 lt!183848))))

(assert (=> d!38122 (= lt!183847 (readBitPure!0 lt!183684))))

(assert (=> d!38122 (= lt!183848 (BitStream!4307 (buf!2838 (_2!5254 lt!183674)) (currentByte!5499 lt!183684) (currentBit!5494 lt!183684)))))

(assert (=> d!38122 (invariant!0 (currentBit!5494 lt!183684) (currentByte!5499 lt!183684) (size!2416 (buf!2838 (_2!5254 lt!183674))))))

(assert (=> d!38122 (= (readBitPrefixLemma!0 lt!183684 (_2!5254 lt!183674)) lt!183846)))

(declare-fun b!119131 () Bool)

(assert (=> b!119131 (= e!78087 (= (_2!5253 lt!183847) (_2!5253 lt!183849)))))

(assert (= (and d!38122 res!98610) b!119131))

(declare-fun m!179271 () Bool)

(assert (=> d!38122 m!179271))

(declare-fun m!179273 () Bool)

(assert (=> d!38122 m!179273))

(declare-fun m!179275 () Bool)

(assert (=> d!38122 m!179275))

(declare-fun m!179277 () Bool)

(assert (=> d!38122 m!179277))

(assert (=> d!38122 m!179071))

(declare-fun m!179279 () Bool)

(assert (=> d!38122 m!179279))

(assert (=> b!119037 d!38122))

(declare-datatypes ((tuple2!10000 0))(
  ( (tuple2!10001 (_1!5265 (_ BitVec 64)) (_2!5265 BitStream!4306)) )
))
(declare-fun lt!183852 () tuple2!10000)

(declare-fun d!38124 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10000)

(assert (=> d!38124 (= lt!183852 (readNLeastSignificantBitsLoop!0 (_1!5255 lt!183689) nBits!396 i!615 lt!183690))))

(assert (=> d!38124 (= (readNLeastSignificantBitsLoopPure!0 (_1!5255 lt!183689) nBits!396 i!615 lt!183690) (tuple2!9983 (_2!5265 lt!183852) (_1!5265 lt!183852)))))

(declare-fun bs!9228 () Bool)

(assert (= bs!9228 d!38124))

(declare-fun m!179281 () Bool)

(assert (=> bs!9228 m!179281))

(assert (=> b!119037 d!38124))

(declare-fun b!119142 () Bool)

(declare-fun res!98617 () Bool)

(declare-fun e!78093 () Bool)

(assert (=> b!119142 (=> (not res!98617) (not e!78093))))

(declare-fun lt!183905 () tuple2!9980)

(assert (=> b!119142 (= res!98617 (isPrefixOf!0 (_2!5255 lt!183905) (_2!5254 lt!183674)))))

(declare-fun b!119143 () Bool)

(declare-fun res!98619 () Bool)

(assert (=> b!119143 (=> (not res!98619) (not e!78093))))

(assert (=> b!119143 (= res!98619 (isPrefixOf!0 (_1!5255 lt!183905) thiss!1305))))

(declare-fun d!38126 () Bool)

(assert (=> d!38126 e!78093))

(declare-fun res!98618 () Bool)

(assert (=> d!38126 (=> (not res!98618) (not e!78093))))

(assert (=> d!38126 (= res!98618 (isPrefixOf!0 (_1!5255 lt!183905) (_2!5255 lt!183905)))))

(declare-fun lt!183900 () BitStream!4306)

(assert (=> d!38126 (= lt!183905 (tuple2!9981 lt!183900 (_2!5254 lt!183674)))))

(declare-fun lt!183911 () Unit!7327)

(declare-fun lt!183904 () Unit!7327)

(assert (=> d!38126 (= lt!183911 lt!183904)))

(assert (=> d!38126 (isPrefixOf!0 lt!183900 (_2!5254 lt!183674))))

(assert (=> d!38126 (= lt!183904 (lemmaIsPrefixTransitive!0 lt!183900 (_2!5254 lt!183674) (_2!5254 lt!183674)))))

(declare-fun lt!183909 () Unit!7327)

(declare-fun lt!183907 () Unit!7327)

(assert (=> d!38126 (= lt!183909 lt!183907)))

(assert (=> d!38126 (isPrefixOf!0 lt!183900 (_2!5254 lt!183674))))

(assert (=> d!38126 (= lt!183907 (lemmaIsPrefixTransitive!0 lt!183900 thiss!1305 (_2!5254 lt!183674)))))

(declare-fun lt!183901 () Unit!7327)

(declare-fun e!78092 () Unit!7327)

(assert (=> d!38126 (= lt!183901 e!78092)))

(declare-fun c!7153 () Bool)

(assert (=> d!38126 (= c!7153 (not (= (size!2416 (buf!2838 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!183902 () Unit!7327)

(declare-fun lt!183898 () Unit!7327)

(assert (=> d!38126 (= lt!183902 lt!183898)))

(assert (=> d!38126 (isPrefixOf!0 (_2!5254 lt!183674) (_2!5254 lt!183674))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4306) Unit!7327)

(assert (=> d!38126 (= lt!183898 (lemmaIsPrefixRefl!0 (_2!5254 lt!183674)))))

(declare-fun lt!183893 () Unit!7327)

(declare-fun lt!183895 () Unit!7327)

(assert (=> d!38126 (= lt!183893 lt!183895)))

(assert (=> d!38126 (= lt!183895 (lemmaIsPrefixRefl!0 (_2!5254 lt!183674)))))

(declare-fun lt!183910 () Unit!7327)

(declare-fun lt!183894 () Unit!7327)

(assert (=> d!38126 (= lt!183910 lt!183894)))

(assert (=> d!38126 (isPrefixOf!0 lt!183900 lt!183900)))

(assert (=> d!38126 (= lt!183894 (lemmaIsPrefixRefl!0 lt!183900))))

(declare-fun lt!183899 () Unit!7327)

(declare-fun lt!183912 () Unit!7327)

(assert (=> d!38126 (= lt!183899 lt!183912)))

(assert (=> d!38126 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!38126 (= lt!183912 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!38126 (= lt!183900 (BitStream!4307 (buf!2838 (_2!5254 lt!183674)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)))))

(assert (=> d!38126 (isPrefixOf!0 thiss!1305 (_2!5254 lt!183674))))

(assert (=> d!38126 (= (reader!0 thiss!1305 (_2!5254 lt!183674)) lt!183905)))

(declare-fun b!119144 () Bool)

(declare-fun lt!183906 () Unit!7327)

(assert (=> b!119144 (= e!78092 lt!183906)))

(declare-fun lt!183903 () (_ BitVec 64))

(assert (=> b!119144 (= lt!183903 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183896 () (_ BitVec 64))

(assert (=> b!119144 (= lt!183896 (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5330 array!5330 (_ BitVec 64) (_ BitVec 64)) Unit!7327)

(assert (=> b!119144 (= lt!183906 (arrayBitRangesEqSymmetric!0 (buf!2838 thiss!1305) (buf!2838 (_2!5254 lt!183674)) lt!183903 lt!183896))))

(assert (=> b!119144 (arrayBitRangesEq!0 (buf!2838 (_2!5254 lt!183674)) (buf!2838 thiss!1305) lt!183903 lt!183896)))

(declare-fun lt!183908 () (_ BitVec 64))

(declare-fun b!119145 () Bool)

(declare-fun lt!183897 () (_ BitVec 64))

(assert (=> b!119145 (= e!78093 (= (_1!5255 lt!183905) (withMovedBitIndex!0 (_2!5255 lt!183905) (bvsub lt!183897 lt!183908))))))

(assert (=> b!119145 (or (= (bvand lt!183897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183908 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183897 lt!183908) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119145 (= lt!183908 (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183674))) (currentByte!5499 (_2!5254 lt!183674)) (currentBit!5494 (_2!5254 lt!183674))))))

(assert (=> b!119145 (= lt!183897 (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)))))

(declare-fun b!119146 () Bool)

(declare-fun Unit!7333 () Unit!7327)

(assert (=> b!119146 (= e!78092 Unit!7333)))

(assert (= (and d!38126 c!7153) b!119144))

(assert (= (and d!38126 (not c!7153)) b!119146))

(assert (= (and d!38126 res!98618) b!119143))

(assert (= (and b!119143 res!98619) b!119142))

(assert (= (and b!119142 res!98617) b!119145))

(declare-fun m!179283 () Bool)

(assert (=> b!119142 m!179283))

(declare-fun m!179285 () Bool)

(assert (=> b!119145 m!179285))

(assert (=> b!119145 m!179095))

(assert (=> b!119145 m!179097))

(declare-fun m!179287 () Bool)

(assert (=> b!119143 m!179287))

(declare-fun m!179289 () Bool)

(assert (=> d!38126 m!179289))

(declare-fun m!179291 () Bool)

(assert (=> d!38126 m!179291))

(declare-fun m!179293 () Bool)

(assert (=> d!38126 m!179293))

(declare-fun m!179295 () Bool)

(assert (=> d!38126 m!179295))

(declare-fun m!179297 () Bool)

(assert (=> d!38126 m!179297))

(declare-fun m!179299 () Bool)

(assert (=> d!38126 m!179299))

(declare-fun m!179301 () Bool)

(assert (=> d!38126 m!179301))

(assert (=> d!38126 m!179083))

(declare-fun m!179303 () Bool)

(assert (=> d!38126 m!179303))

(declare-fun m!179305 () Bool)

(assert (=> d!38126 m!179305))

(declare-fun m!179307 () Bool)

(assert (=> d!38126 m!179307))

(assert (=> b!119144 m!179097))

(declare-fun m!179309 () Bool)

(assert (=> b!119144 m!179309))

(declare-fun m!179311 () Bool)

(assert (=> b!119144 m!179311))

(assert (=> b!119037 d!38126))

(declare-fun d!38128 () Bool)

(declare-fun res!98621 () Bool)

(declare-fun e!78094 () Bool)

(assert (=> d!38128 (=> (not res!98621) (not e!78094))))

(assert (=> d!38128 (= res!98621 (= (size!2416 (buf!2838 thiss!1305)) (size!2416 (buf!2838 (_2!5254 lt!183674)))))))

(assert (=> d!38128 (= (isPrefixOf!0 thiss!1305 (_2!5254 lt!183674)) e!78094)))

(declare-fun b!119147 () Bool)

(declare-fun res!98622 () Bool)

(assert (=> b!119147 (=> (not res!98622) (not e!78094))))

(assert (=> b!119147 (= res!98622 (bvsle (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)) (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183674))) (currentByte!5499 (_2!5254 lt!183674)) (currentBit!5494 (_2!5254 lt!183674)))))))

(declare-fun b!119148 () Bool)

(declare-fun e!78095 () Bool)

(assert (=> b!119148 (= e!78094 e!78095)))

(declare-fun res!98620 () Bool)

(assert (=> b!119148 (=> res!98620 e!78095)))

(assert (=> b!119148 (= res!98620 (= (size!2416 (buf!2838 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!119149 () Bool)

(assert (=> b!119149 (= e!78095 (arrayBitRangesEq!0 (buf!2838 thiss!1305) (buf!2838 (_2!5254 lt!183674)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305))))))

(assert (= (and d!38128 res!98621) b!119147))

(assert (= (and b!119147 res!98622) b!119148))

(assert (= (and b!119148 (not res!98620)) b!119149))

(assert (=> b!119147 m!179097))

(assert (=> b!119147 m!179095))

(assert (=> b!119149 m!179097))

(assert (=> b!119149 m!179097))

(declare-fun m!179313 () Bool)

(assert (=> b!119149 m!179313))

(assert (=> b!119037 d!38128))

(declare-fun b!119161 () Bool)

(declare-fun e!78100 () Bool)

(declare-fun e!78101 () Bool)

(assert (=> b!119161 (= e!78100 e!78101)))

(declare-fun res!98634 () Bool)

(assert (=> b!119161 (=> (not res!98634) (not e!78101))))

(declare-fun lt!183921 () tuple2!9976)

(declare-fun lt!183922 () tuple2!9978)

(assert (=> b!119161 (= res!98634 (and (= (_2!5253 lt!183921) lt!183686) (= (_1!5253 lt!183921) (_2!5254 lt!183922))))))

(assert (=> b!119161 (= lt!183921 (readBitPure!0 (readerFrom!0 (_2!5254 lt!183922) (currentBit!5494 thiss!1305) (currentByte!5499 thiss!1305))))))

(declare-fun b!119162 () Bool)

(assert (=> b!119162 (= e!78101 (= (bitIndex!0 (size!2416 (buf!2838 (_1!5253 lt!183921))) (currentByte!5499 (_1!5253 lt!183921)) (currentBit!5494 (_1!5253 lt!183921))) (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183922))) (currentByte!5499 (_2!5254 lt!183922)) (currentBit!5494 (_2!5254 lt!183922)))))))

(declare-fun b!119160 () Bool)

(declare-fun res!98631 () Bool)

(assert (=> b!119160 (=> (not res!98631) (not e!78100))))

(assert (=> b!119160 (= res!98631 (isPrefixOf!0 thiss!1305 (_2!5254 lt!183922)))))

(declare-fun d!38130 () Bool)

(assert (=> d!38130 e!78100))

(declare-fun res!98633 () Bool)

(assert (=> d!38130 (=> (not res!98633) (not e!78100))))

(assert (=> d!38130 (= res!98633 (= (size!2416 (buf!2838 thiss!1305)) (size!2416 (buf!2838 (_2!5254 lt!183922)))))))

(declare-fun choose!16 (BitStream!4306 Bool) tuple2!9978)

(assert (=> d!38130 (= lt!183922 (choose!16 thiss!1305 lt!183686))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38130 (validate_offset_bit!0 ((_ sign_extend 32) (size!2416 (buf!2838 thiss!1305))) ((_ sign_extend 32) (currentByte!5499 thiss!1305)) ((_ sign_extend 32) (currentBit!5494 thiss!1305)))))

(assert (=> d!38130 (= (appendBit!0 thiss!1305 lt!183686) lt!183922)))

(declare-fun b!119159 () Bool)

(declare-fun res!98632 () Bool)

(assert (=> b!119159 (=> (not res!98632) (not e!78100))))

(declare-fun lt!183924 () (_ BitVec 64))

(declare-fun lt!183923 () (_ BitVec 64))

(assert (=> b!119159 (= res!98632 (= (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183922))) (currentByte!5499 (_2!5254 lt!183922)) (currentBit!5494 (_2!5254 lt!183922))) (bvadd lt!183923 lt!183924)))))

(assert (=> b!119159 (or (not (= (bvand lt!183923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183924 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!183923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!183923 lt!183924) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119159 (= lt!183924 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!119159 (= lt!183923 (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)))))

(assert (= (and d!38130 res!98633) b!119159))

(assert (= (and b!119159 res!98632) b!119160))

(assert (= (and b!119160 res!98631) b!119161))

(assert (= (and b!119161 res!98634) b!119162))

(declare-fun m!179315 () Bool)

(assert (=> d!38130 m!179315))

(declare-fun m!179317 () Bool)

(assert (=> d!38130 m!179317))

(declare-fun m!179319 () Bool)

(assert (=> b!119162 m!179319))

(declare-fun m!179321 () Bool)

(assert (=> b!119162 m!179321))

(declare-fun m!179323 () Bool)

(assert (=> b!119161 m!179323))

(assert (=> b!119161 m!179323))

(declare-fun m!179325 () Bool)

(assert (=> b!119161 m!179325))

(declare-fun m!179327 () Bool)

(assert (=> b!119160 m!179327))

(assert (=> b!119159 m!179321))

(assert (=> b!119159 m!179097))

(assert (=> b!119037 d!38130))

(declare-fun d!38132 () Bool)

(assert (=> d!38132 (validate_offset_bits!1 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183674)))) ((_ sign_extend 32) (currentByte!5499 (_2!5254 lt!183685))) ((_ sign_extend 32) (currentBit!5494 (_2!5254 lt!183685))) lt!183693)))

(declare-fun lt!183927 () Unit!7327)

(declare-fun choose!9 (BitStream!4306 array!5330 (_ BitVec 64) BitStream!4306) Unit!7327)

(assert (=> d!38132 (= lt!183927 (choose!9 (_2!5254 lt!183685) (buf!2838 (_2!5254 lt!183674)) lt!183693 (BitStream!4307 (buf!2838 (_2!5254 lt!183674)) (currentByte!5499 (_2!5254 lt!183685)) (currentBit!5494 (_2!5254 lt!183685)))))))

(assert (=> d!38132 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5254 lt!183685) (buf!2838 (_2!5254 lt!183674)) lt!183693) lt!183927)))

(declare-fun bs!9229 () Bool)

(assert (= bs!9229 d!38132))

(assert (=> bs!9229 m!179051))

(declare-fun m!179329 () Bool)

(assert (=> bs!9229 m!179329))

(assert (=> b!119037 d!38132))

(declare-fun d!38134 () Bool)

(declare-fun e!78104 () Bool)

(assert (=> d!38134 e!78104))

(declare-fun res!98639 () Bool)

(assert (=> d!38134 (=> (not res!98639) (not e!78104))))

(declare-fun lt!183943 () (_ BitVec 64))

(declare-fun lt!183942 () (_ BitVec 64))

(declare-fun lt!183944 () (_ BitVec 64))

(assert (=> d!38134 (= res!98639 (= lt!183944 (bvsub lt!183943 lt!183942)))))

(assert (=> d!38134 (or (= (bvand lt!183943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183942 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183943 lt!183942) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38134 (= lt!183942 (remainingBits!0 ((_ sign_extend 32) (size!2416 (buf!2838 (_1!5253 lt!183672)))) ((_ sign_extend 32) (currentByte!5499 (_1!5253 lt!183672))) ((_ sign_extend 32) (currentBit!5494 (_1!5253 lt!183672)))))))

(declare-fun lt!183945 () (_ BitVec 64))

(declare-fun lt!183940 () (_ BitVec 64))

(assert (=> d!38134 (= lt!183943 (bvmul lt!183945 lt!183940))))

(assert (=> d!38134 (or (= lt!183945 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!183940 (bvsdiv (bvmul lt!183945 lt!183940) lt!183945)))))

(assert (=> d!38134 (= lt!183940 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38134 (= lt!183945 ((_ sign_extend 32) (size!2416 (buf!2838 (_1!5253 lt!183672)))))))

(assert (=> d!38134 (= lt!183944 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5499 (_1!5253 lt!183672))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5494 (_1!5253 lt!183672)))))))

(assert (=> d!38134 (invariant!0 (currentBit!5494 (_1!5253 lt!183672)) (currentByte!5499 (_1!5253 lt!183672)) (size!2416 (buf!2838 (_1!5253 lt!183672))))))

(assert (=> d!38134 (= (bitIndex!0 (size!2416 (buf!2838 (_1!5253 lt!183672))) (currentByte!5499 (_1!5253 lt!183672)) (currentBit!5494 (_1!5253 lt!183672))) lt!183944)))

(declare-fun b!119167 () Bool)

(declare-fun res!98640 () Bool)

(assert (=> b!119167 (=> (not res!98640) (not e!78104))))

(assert (=> b!119167 (= res!98640 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!183944))))

(declare-fun b!119168 () Bool)

(declare-fun lt!183941 () (_ BitVec 64))

(assert (=> b!119168 (= e!78104 (bvsle lt!183944 (bvmul lt!183941 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119168 (or (= lt!183941 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!183941 #b0000000000000000000000000000000000000000000000000000000000001000) lt!183941)))))

(assert (=> b!119168 (= lt!183941 ((_ sign_extend 32) (size!2416 (buf!2838 (_1!5253 lt!183672)))))))

(assert (= (and d!38134 res!98639) b!119167))

(assert (= (and b!119167 res!98640) b!119168))

(declare-fun m!179331 () Bool)

(assert (=> d!38134 m!179331))

(declare-fun m!179333 () Bool)

(assert (=> d!38134 m!179333))

(assert (=> b!119037 d!38134))

(declare-fun d!38136 () Bool)

(assert (=> d!38136 (validate_offset_bits!1 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183674)))) ((_ sign_extend 32) (currentByte!5499 thiss!1305)) ((_ sign_extend 32) (currentBit!5494 thiss!1305)) lt!183692)))

(declare-fun lt!183946 () Unit!7327)

(assert (=> d!38136 (= lt!183946 (choose!9 thiss!1305 (buf!2838 (_2!5254 lt!183674)) lt!183692 (BitStream!4307 (buf!2838 (_2!5254 lt!183674)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305))))))

(assert (=> d!38136 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2838 (_2!5254 lt!183674)) lt!183692) lt!183946)))

(declare-fun bs!9230 () Bool)

(assert (= bs!9230 d!38136))

(assert (=> bs!9230 m!179087))

(declare-fun m!179335 () Bool)

(assert (=> bs!9230 m!179335))

(assert (=> b!119037 d!38136))

(declare-fun d!38138 () Bool)

(declare-datatypes ((tuple2!10002 0))(
  ( (tuple2!10003 (_1!5266 Bool) (_2!5266 BitStream!4306)) )
))
(declare-fun lt!183949 () tuple2!10002)

(declare-fun readBit!0 (BitStream!4306) tuple2!10002)

(assert (=> d!38138 (= lt!183949 (readBit!0 lt!183684))))

(assert (=> d!38138 (= (readBitPure!0 lt!183684) (tuple2!9977 (_2!5266 lt!183949) (_1!5266 lt!183949)))))

(declare-fun bs!9231 () Bool)

(assert (= bs!9231 d!38138))

(declare-fun m!179337 () Bool)

(assert (=> bs!9231 m!179337))

(assert (=> b!119037 d!38138))

(declare-fun d!38140 () Bool)

(declare-fun lt!183950 () tuple2!10002)

(assert (=> d!38140 (= lt!183950 (readBit!0 (BitStream!4307 (buf!2838 (_2!5254 lt!183674)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305))))))

(assert (=> d!38140 (= (readBitPure!0 (BitStream!4307 (buf!2838 (_2!5254 lt!183674)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305))) (tuple2!9977 (_2!5266 lt!183950) (_1!5266 lt!183950)))))

(declare-fun bs!9232 () Bool)

(assert (= bs!9232 d!38140))

(declare-fun m!179339 () Bool)

(assert (=> bs!9232 m!179339))

(assert (=> b!119037 d!38140))

(declare-fun b!119169 () Bool)

(declare-fun res!98641 () Bool)

(declare-fun e!78106 () Bool)

(assert (=> b!119169 (=> (not res!98641) (not e!78106))))

(declare-fun lt!183963 () tuple2!9980)

(assert (=> b!119169 (= res!98641 (isPrefixOf!0 (_2!5255 lt!183963) (_2!5254 lt!183674)))))

(declare-fun b!119170 () Bool)

(declare-fun res!98643 () Bool)

(assert (=> b!119170 (=> (not res!98643) (not e!78106))))

(assert (=> b!119170 (= res!98643 (isPrefixOf!0 (_1!5255 lt!183963) (_2!5254 lt!183685)))))

(declare-fun d!38142 () Bool)

(assert (=> d!38142 e!78106))

(declare-fun res!98642 () Bool)

(assert (=> d!38142 (=> (not res!98642) (not e!78106))))

(assert (=> d!38142 (= res!98642 (isPrefixOf!0 (_1!5255 lt!183963) (_2!5255 lt!183963)))))

(declare-fun lt!183958 () BitStream!4306)

(assert (=> d!38142 (= lt!183963 (tuple2!9981 lt!183958 (_2!5254 lt!183674)))))

(declare-fun lt!183969 () Unit!7327)

(declare-fun lt!183962 () Unit!7327)

(assert (=> d!38142 (= lt!183969 lt!183962)))

(assert (=> d!38142 (isPrefixOf!0 lt!183958 (_2!5254 lt!183674))))

(assert (=> d!38142 (= lt!183962 (lemmaIsPrefixTransitive!0 lt!183958 (_2!5254 lt!183674) (_2!5254 lt!183674)))))

(declare-fun lt!183967 () Unit!7327)

(declare-fun lt!183965 () Unit!7327)

(assert (=> d!38142 (= lt!183967 lt!183965)))

(assert (=> d!38142 (isPrefixOf!0 lt!183958 (_2!5254 lt!183674))))

(assert (=> d!38142 (= lt!183965 (lemmaIsPrefixTransitive!0 lt!183958 (_2!5254 lt!183685) (_2!5254 lt!183674)))))

(declare-fun lt!183959 () Unit!7327)

(declare-fun e!78105 () Unit!7327)

(assert (=> d!38142 (= lt!183959 e!78105)))

(declare-fun c!7154 () Bool)

(assert (=> d!38142 (= c!7154 (not (= (size!2416 (buf!2838 (_2!5254 lt!183685))) #b00000000000000000000000000000000)))))

(declare-fun lt!183960 () Unit!7327)

(declare-fun lt!183956 () Unit!7327)

(assert (=> d!38142 (= lt!183960 lt!183956)))

(assert (=> d!38142 (isPrefixOf!0 (_2!5254 lt!183674) (_2!5254 lt!183674))))

(assert (=> d!38142 (= lt!183956 (lemmaIsPrefixRefl!0 (_2!5254 lt!183674)))))

(declare-fun lt!183951 () Unit!7327)

(declare-fun lt!183953 () Unit!7327)

(assert (=> d!38142 (= lt!183951 lt!183953)))

(assert (=> d!38142 (= lt!183953 (lemmaIsPrefixRefl!0 (_2!5254 lt!183674)))))

(declare-fun lt!183968 () Unit!7327)

(declare-fun lt!183952 () Unit!7327)

(assert (=> d!38142 (= lt!183968 lt!183952)))

(assert (=> d!38142 (isPrefixOf!0 lt!183958 lt!183958)))

(assert (=> d!38142 (= lt!183952 (lemmaIsPrefixRefl!0 lt!183958))))

(declare-fun lt!183957 () Unit!7327)

(declare-fun lt!183970 () Unit!7327)

(assert (=> d!38142 (= lt!183957 lt!183970)))

(assert (=> d!38142 (isPrefixOf!0 (_2!5254 lt!183685) (_2!5254 lt!183685))))

(assert (=> d!38142 (= lt!183970 (lemmaIsPrefixRefl!0 (_2!5254 lt!183685)))))

(assert (=> d!38142 (= lt!183958 (BitStream!4307 (buf!2838 (_2!5254 lt!183674)) (currentByte!5499 (_2!5254 lt!183685)) (currentBit!5494 (_2!5254 lt!183685))))))

(assert (=> d!38142 (isPrefixOf!0 (_2!5254 lt!183685) (_2!5254 lt!183674))))

(assert (=> d!38142 (= (reader!0 (_2!5254 lt!183685) (_2!5254 lt!183674)) lt!183963)))

(declare-fun b!119171 () Bool)

(declare-fun lt!183964 () Unit!7327)

(assert (=> b!119171 (= e!78105 lt!183964)))

(declare-fun lt!183961 () (_ BitVec 64))

(assert (=> b!119171 (= lt!183961 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183954 () (_ BitVec 64))

(assert (=> b!119171 (= lt!183954 (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183685))) (currentByte!5499 (_2!5254 lt!183685)) (currentBit!5494 (_2!5254 lt!183685))))))

(assert (=> b!119171 (= lt!183964 (arrayBitRangesEqSymmetric!0 (buf!2838 (_2!5254 lt!183685)) (buf!2838 (_2!5254 lt!183674)) lt!183961 lt!183954))))

(assert (=> b!119171 (arrayBitRangesEq!0 (buf!2838 (_2!5254 lt!183674)) (buf!2838 (_2!5254 lt!183685)) lt!183961 lt!183954)))

(declare-fun b!119172 () Bool)

(declare-fun lt!183966 () (_ BitVec 64))

(declare-fun lt!183955 () (_ BitVec 64))

(assert (=> b!119172 (= e!78106 (= (_1!5255 lt!183963) (withMovedBitIndex!0 (_2!5255 lt!183963) (bvsub lt!183955 lt!183966))))))

(assert (=> b!119172 (or (= (bvand lt!183955 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183966 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!183955 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!183955 lt!183966) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119172 (= lt!183966 (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183674))) (currentByte!5499 (_2!5254 lt!183674)) (currentBit!5494 (_2!5254 lt!183674))))))

(assert (=> b!119172 (= lt!183955 (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183685))) (currentByte!5499 (_2!5254 lt!183685)) (currentBit!5494 (_2!5254 lt!183685))))))

(declare-fun b!119173 () Bool)

(declare-fun Unit!7334 () Unit!7327)

(assert (=> b!119173 (= e!78105 Unit!7334)))

(assert (= (and d!38142 c!7154) b!119171))

(assert (= (and d!38142 (not c!7154)) b!119173))

(assert (= (and d!38142 res!98642) b!119170))

(assert (= (and b!119170 res!98643) b!119169))

(assert (= (and b!119169 res!98641) b!119172))

(declare-fun m!179341 () Bool)

(assert (=> b!119169 m!179341))

(declare-fun m!179343 () Bool)

(assert (=> b!119172 m!179343))

(assert (=> b!119172 m!179095))

(assert (=> b!119172 m!179109))

(declare-fun m!179345 () Bool)

(assert (=> b!119170 m!179345))

(declare-fun m!179347 () Bool)

(assert (=> d!38142 m!179347))

(declare-fun m!179349 () Bool)

(assert (=> d!38142 m!179349))

(declare-fun m!179351 () Bool)

(assert (=> d!38142 m!179351))

(declare-fun m!179353 () Bool)

(assert (=> d!38142 m!179353))

(declare-fun m!179355 () Bool)

(assert (=> d!38142 m!179355))

(assert (=> d!38142 m!179299))

(assert (=> d!38142 m!179301))

(declare-fun m!179357 () Bool)

(assert (=> d!38142 m!179357))

(declare-fun m!179359 () Bool)

(assert (=> d!38142 m!179359))

(declare-fun m!179361 () Bool)

(assert (=> d!38142 m!179361))

(declare-fun m!179363 () Bool)

(assert (=> d!38142 m!179363))

(assert (=> b!119171 m!179109))

(declare-fun m!179365 () Bool)

(assert (=> b!119171 m!179365))

(declare-fun m!179367 () Bool)

(assert (=> b!119171 m!179367))

(assert (=> b!119037 d!38142))

(declare-fun b!119294 () Bool)

(declare-fun res!98745 () Bool)

(declare-fun lt!184369 () tuple2!9978)

(assert (=> b!119294 (= res!98745 (= (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!184369))) (currentByte!5499 (_2!5254 lt!184369)) (currentBit!5494 (_2!5254 lt!184369))) (bvadd (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183685))) (currentByte!5499 (_2!5254 lt!183685)) (currentBit!5494 (_2!5254 lt!183685))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!78170 () Bool)

(assert (=> b!119294 (=> (not res!98745) (not e!78170))))

(declare-fun b!119295 () Bool)

(declare-fun e!78171 () Bool)

(declare-fun lt!184342 () tuple2!9976)

(assert (=> b!119295 (= e!78171 (= (bitIndex!0 (size!2416 (buf!2838 (_1!5253 lt!184342))) (currentByte!5499 (_1!5253 lt!184342)) (currentBit!5494 (_1!5253 lt!184342))) (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!184369))) (currentByte!5499 (_2!5254 lt!184369)) (currentBit!5494 (_2!5254 lt!184369)))))))

(declare-fun b!119296 () Bool)

(declare-fun res!98748 () Bool)

(assert (=> b!119296 (= res!98748 (isPrefixOf!0 (_2!5254 lt!183685) (_2!5254 lt!184369)))))

(assert (=> b!119296 (=> (not res!98748) (not e!78170))))

(declare-fun b!119297 () Bool)

(declare-fun e!78174 () Bool)

(declare-fun lt!184376 () (_ BitVec 64))

(assert (=> b!119297 (= e!78174 (validate_offset_bits!1 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183685)))) ((_ sign_extend 32) (currentByte!5499 (_2!5254 lt!183685))) ((_ sign_extend 32) (currentBit!5494 (_2!5254 lt!183685))) lt!184376))))

(declare-fun b!119298 () Bool)

(declare-fun e!78169 () Bool)

(declare-fun lt!184365 () tuple2!9976)

(declare-fun lt!184371 () tuple2!9976)

(assert (=> b!119298 (= e!78169 (= (_2!5253 lt!184365) (_2!5253 lt!184371)))))

(declare-fun call!1547 () Bool)

(declare-fun lt!184336 () BitStream!4306)

(declare-fun lt!184352 () tuple2!9978)

(declare-fun bm!1544 () Bool)

(declare-fun c!7165 () Bool)

(assert (=> bm!1544 (= call!1547 (isPrefixOf!0 (ite c!7165 (_2!5254 lt!183685) lt!184336) (ite c!7165 (_2!5254 lt!184352) lt!184336)))))

(declare-fun b!119300 () Bool)

(declare-fun e!78175 () (_ BitVec 64))

(assert (=> b!119300 (= e!78175 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!119301 () Bool)

(declare-fun res!98744 () Bool)

(declare-fun e!78172 () Bool)

(assert (=> b!119301 (=> (not res!98744) (not e!78172))))

(declare-fun lt!184358 () tuple2!9978)

(declare-fun lt!184364 () (_ BitVec 64))

(declare-fun lt!184346 () (_ BitVec 64))

(assert (=> b!119301 (= res!98744 (= (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!184358))) (currentByte!5499 (_2!5254 lt!184358)) (currentBit!5494 (_2!5254 lt!184358))) (bvadd lt!184346 lt!184364)))))

(assert (=> b!119301 (or (not (= (bvand lt!184346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184364 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!184346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!184346 lt!184364) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119301 (= lt!184364 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!119301 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119301 (= lt!184346 (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183685))) (currentByte!5499 (_2!5254 lt!183685)) (currentBit!5494 (_2!5254 lt!183685))))))

(declare-fun b!119302 () Bool)

(declare-fun res!98743 () Bool)

(assert (=> b!119302 (=> (not res!98743) (not e!78172))))

(assert (=> b!119302 (= res!98743 (isPrefixOf!0 (_2!5254 lt!183685) (_2!5254 lt!184358)))))

(declare-fun d!38144 () Bool)

(assert (=> d!38144 e!78172))

(declare-fun res!98746 () Bool)

(assert (=> d!38144 (=> (not res!98746) (not e!78172))))

(assert (=> d!38144 (= res!98746 (= (size!2416 (buf!2838 (_2!5254 lt!183685))) (size!2416 (buf!2838 (_2!5254 lt!184358)))))))

(declare-fun e!78173 () tuple2!9978)

(assert (=> d!38144 (= lt!184358 e!78173)))

(assert (=> d!38144 (= c!7165 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!38144 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!38144 (= (appendNLeastSignificantBitsLoop!0 (_2!5254 lt!183685) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!184358)))

(declare-fun b!119299 () Bool)

(assert (=> b!119299 (= e!78175 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!119303 () Bool)

(assert (=> b!119303 (= lt!184342 (readBitPure!0 (readerFrom!0 (_2!5254 lt!184369) (currentBit!5494 (_2!5254 lt!183685)) (currentByte!5499 (_2!5254 lt!183685)))))))

(declare-fun res!98749 () Bool)

(declare-fun lt!184344 () Bool)

(assert (=> b!119303 (= res!98749 (and (= (_2!5253 lt!184342) lt!184344) (= (_1!5253 lt!184342) (_2!5254 lt!184369))))))

(assert (=> b!119303 (=> (not res!98749) (not e!78171))))

(assert (=> b!119303 (= e!78170 e!78171)))

(declare-fun b!119304 () Bool)

(declare-fun lt!184343 () Unit!7327)

(assert (=> b!119304 (= e!78173 (tuple2!9979 lt!184343 (_2!5254 lt!183685)))))

(assert (=> b!119304 (= lt!184336 (_2!5254 lt!183685))))

(assert (=> b!119304 (= lt!184343 (lemmaIsPrefixRefl!0 lt!184336))))

(assert (=> b!119304 call!1547))

(declare-fun b!119305 () Bool)

(declare-fun lt!184337 () tuple2!9982)

(declare-fun lt!184380 () tuple2!9980)

(assert (=> b!119305 (= e!78172 (and (= (_2!5256 lt!184337) v!199) (= (_1!5256 lt!184337) (_2!5255 lt!184380))))))

(declare-fun lt!184378 () (_ BitVec 64))

(assert (=> b!119305 (= lt!184337 (readNLeastSignificantBitsLoopPure!0 (_1!5255 lt!184380) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184378))))

(declare-fun lt!184361 () Unit!7327)

(declare-fun lt!184374 () Unit!7327)

(assert (=> b!119305 (= lt!184361 lt!184374)))

(assert (=> b!119305 (validate_offset_bits!1 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!184358)))) ((_ sign_extend 32) (currentByte!5499 (_2!5254 lt!183685))) ((_ sign_extend 32) (currentBit!5494 (_2!5254 lt!183685))) lt!184376)))

(assert (=> b!119305 (= lt!184374 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5254 lt!183685) (buf!2838 (_2!5254 lt!184358)) lt!184376))))

(assert (=> b!119305 e!78174))

(declare-fun res!98747 () Bool)

(assert (=> b!119305 (=> (not res!98747) (not e!78174))))

(assert (=> b!119305 (= res!98747 (and (= (size!2416 (buf!2838 (_2!5254 lt!183685))) (size!2416 (buf!2838 (_2!5254 lt!184358)))) (bvsge lt!184376 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119305 (= lt!184376 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!119305 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119305 (= lt!184378 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!119305 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119305 (= lt!184380 (reader!0 (_2!5254 lt!183685) (_2!5254 lt!184358)))))

(declare-fun b!119306 () Bool)

(declare-fun Unit!7335 () Unit!7327)

(assert (=> b!119306 (= e!78173 (tuple2!9979 Unit!7335 (_2!5254 lt!184352)))))

(assert (=> b!119306 (= lt!184344 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119306 (= lt!184369 (appendBit!0 (_2!5254 lt!183685) lt!184344))))

(declare-fun res!98742 () Bool)

(assert (=> b!119306 (= res!98742 (= (size!2416 (buf!2838 (_2!5254 lt!183685))) (size!2416 (buf!2838 (_2!5254 lt!184369)))))))

(assert (=> b!119306 (=> (not res!98742) (not e!78170))))

(assert (=> b!119306 e!78170))

(declare-fun lt!184345 () tuple2!9978)

(assert (=> b!119306 (= lt!184345 lt!184369)))

(assert (=> b!119306 (= lt!184352 (appendNLeastSignificantBitsLoop!0 (_2!5254 lt!184345) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!184338 () Unit!7327)

(assert (=> b!119306 (= lt!184338 (lemmaIsPrefixTransitive!0 (_2!5254 lt!183685) (_2!5254 lt!184345) (_2!5254 lt!184352)))))

(assert (=> b!119306 call!1547))

(declare-fun lt!184360 () Unit!7327)

(assert (=> b!119306 (= lt!184360 lt!184338)))

(assert (=> b!119306 (invariant!0 (currentBit!5494 (_2!5254 lt!183685)) (currentByte!5499 (_2!5254 lt!183685)) (size!2416 (buf!2838 (_2!5254 lt!184345))))))

(declare-fun lt!184359 () BitStream!4306)

(assert (=> b!119306 (= lt!184359 (BitStream!4307 (buf!2838 (_2!5254 lt!184345)) (currentByte!5499 (_2!5254 lt!183685)) (currentBit!5494 (_2!5254 lt!183685))))))

(assert (=> b!119306 (invariant!0 (currentBit!5494 lt!184359) (currentByte!5499 lt!184359) (size!2416 (buf!2838 (_2!5254 lt!184352))))))

(declare-fun lt!184379 () BitStream!4306)

(assert (=> b!119306 (= lt!184379 (BitStream!4307 (buf!2838 (_2!5254 lt!184352)) (currentByte!5499 lt!184359) (currentBit!5494 lt!184359)))))

(assert (=> b!119306 (= lt!184365 (readBitPure!0 lt!184359))))

(assert (=> b!119306 (= lt!184371 (readBitPure!0 lt!184379))))

(declare-fun lt!184363 () Unit!7327)

(assert (=> b!119306 (= lt!184363 (readBitPrefixLemma!0 lt!184359 (_2!5254 lt!184352)))))

(declare-fun res!98750 () Bool)

(assert (=> b!119306 (= res!98750 (= (bitIndex!0 (size!2416 (buf!2838 (_1!5253 lt!184365))) (currentByte!5499 (_1!5253 lt!184365)) (currentBit!5494 (_1!5253 lt!184365))) (bitIndex!0 (size!2416 (buf!2838 (_1!5253 lt!184371))) (currentByte!5499 (_1!5253 lt!184371)) (currentBit!5494 (_1!5253 lt!184371)))))))

(assert (=> b!119306 (=> (not res!98750) (not e!78169))))

(assert (=> b!119306 e!78169))

(declare-fun lt!184370 () Unit!7327)

(assert (=> b!119306 (= lt!184370 lt!184363)))

(declare-fun lt!184373 () tuple2!9980)

(assert (=> b!119306 (= lt!184373 (reader!0 (_2!5254 lt!183685) (_2!5254 lt!184352)))))

(declare-fun lt!184340 () tuple2!9980)

(assert (=> b!119306 (= lt!184340 (reader!0 (_2!5254 lt!184345) (_2!5254 lt!184352)))))

(declare-fun lt!184357 () tuple2!9976)

(assert (=> b!119306 (= lt!184357 (readBitPure!0 (_1!5255 lt!184373)))))

(assert (=> b!119306 (= (_2!5253 lt!184357) lt!184344)))

(declare-fun lt!184368 () Unit!7327)

(declare-fun Unit!7336 () Unit!7327)

(assert (=> b!119306 (= lt!184368 Unit!7336)))

(declare-fun lt!184339 () (_ BitVec 64))

(assert (=> b!119306 (= lt!184339 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!184377 () (_ BitVec 64))

(assert (=> b!119306 (= lt!184377 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!184349 () Unit!7327)

(assert (=> b!119306 (= lt!184349 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5254 lt!183685) (buf!2838 (_2!5254 lt!184352)) lt!184377))))

(assert (=> b!119306 (validate_offset_bits!1 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!184352)))) ((_ sign_extend 32) (currentByte!5499 (_2!5254 lt!183685))) ((_ sign_extend 32) (currentBit!5494 (_2!5254 lt!183685))) lt!184377)))

(declare-fun lt!184351 () Unit!7327)

(assert (=> b!119306 (= lt!184351 lt!184349)))

(declare-fun lt!184367 () tuple2!9982)

(assert (=> b!119306 (= lt!184367 (readNLeastSignificantBitsLoopPure!0 (_1!5255 lt!184373) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184339))))

(declare-fun lt!184362 () (_ BitVec 64))

(assert (=> b!119306 (= lt!184362 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!184355 () Unit!7327)

(assert (=> b!119306 (= lt!184355 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5254 lt!184345) (buf!2838 (_2!5254 lt!184352)) lt!184362))))

(assert (=> b!119306 (validate_offset_bits!1 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!184352)))) ((_ sign_extend 32) (currentByte!5499 (_2!5254 lt!184345))) ((_ sign_extend 32) (currentBit!5494 (_2!5254 lt!184345))) lt!184362)))

(declare-fun lt!184353 () Unit!7327)

(assert (=> b!119306 (= lt!184353 lt!184355)))

(declare-fun lt!184366 () tuple2!9982)

(assert (=> b!119306 (= lt!184366 (readNLeastSignificantBitsLoopPure!0 (_1!5255 lt!184340) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!184339 (ite (_2!5253 lt!184357) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!184354 () tuple2!9982)

(assert (=> b!119306 (= lt!184354 (readNLeastSignificantBitsLoopPure!0 (_1!5255 lt!184373) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184339))))

(declare-fun c!7166 () Bool)

(assert (=> b!119306 (= c!7166 (_2!5253 (readBitPure!0 (_1!5255 lt!184373))))))

(declare-fun lt!184375 () tuple2!9982)

(assert (=> b!119306 (= lt!184375 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5255 lt!184373) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!184339 e!78175)))))

(declare-fun lt!184350 () Unit!7327)

(assert (=> b!119306 (= lt!184350 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5255 lt!184373) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184339))))

(assert (=> b!119306 (and (= (_2!5256 lt!184354) (_2!5256 lt!184375)) (= (_1!5256 lt!184354) (_1!5256 lt!184375)))))

(declare-fun lt!184347 () Unit!7327)

(assert (=> b!119306 (= lt!184347 lt!184350)))

(assert (=> b!119306 (= (_1!5255 lt!184373) (withMovedBitIndex!0 (_2!5255 lt!184373) (bvsub (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183685))) (currentByte!5499 (_2!5254 lt!183685)) (currentBit!5494 (_2!5254 lt!183685))) (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!184352))) (currentByte!5499 (_2!5254 lt!184352)) (currentBit!5494 (_2!5254 lt!184352))))))))

(declare-fun lt!184356 () Unit!7327)

(declare-fun Unit!7337 () Unit!7327)

(assert (=> b!119306 (= lt!184356 Unit!7337)))

(assert (=> b!119306 (= (_1!5255 lt!184340) (withMovedBitIndex!0 (_2!5255 lt!184340) (bvsub (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!184345))) (currentByte!5499 (_2!5254 lt!184345)) (currentBit!5494 (_2!5254 lt!184345))) (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!184352))) (currentByte!5499 (_2!5254 lt!184352)) (currentBit!5494 (_2!5254 lt!184352))))))))

(declare-fun lt!184341 () Unit!7327)

(declare-fun Unit!7338 () Unit!7327)

(assert (=> b!119306 (= lt!184341 Unit!7338)))

(assert (=> b!119306 (= (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183685))) (currentByte!5499 (_2!5254 lt!183685)) (currentBit!5494 (_2!5254 lt!183685))) (bvsub (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!184345))) (currentByte!5499 (_2!5254 lt!184345)) (currentBit!5494 (_2!5254 lt!184345))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!184348 () Unit!7327)

(declare-fun Unit!7339 () Unit!7327)

(assert (=> b!119306 (= lt!184348 Unit!7339)))

(assert (=> b!119306 (= (_2!5256 lt!184367) (_2!5256 lt!184366))))

(declare-fun lt!184372 () Unit!7327)

(declare-fun Unit!7340 () Unit!7327)

(assert (=> b!119306 (= lt!184372 Unit!7340)))

(assert (=> b!119306 (= (_1!5256 lt!184367) (_2!5255 lt!184373))))

(assert (= (and d!38144 c!7165) b!119306))

(assert (= (and d!38144 (not c!7165)) b!119304))

(assert (= (and b!119306 res!98742) b!119294))

(assert (= (and b!119294 res!98745) b!119296))

(assert (= (and b!119296 res!98748) b!119303))

(assert (= (and b!119303 res!98749) b!119295))

(assert (= (and b!119306 res!98750) b!119298))

(assert (= (and b!119306 c!7166) b!119300))

(assert (= (and b!119306 (not c!7166)) b!119299))

(assert (= (or b!119306 b!119304) bm!1544))

(assert (= (and d!38144 res!98746) b!119301))

(assert (= (and b!119301 res!98744) b!119302))

(assert (= (and b!119302 res!98743) b!119305))

(assert (= (and b!119305 res!98747) b!119297))

(declare-fun m!179543 () Bool)

(assert (=> b!119305 m!179543))

(declare-fun m!179545 () Bool)

(assert (=> b!119305 m!179545))

(declare-fun m!179547 () Bool)

(assert (=> b!119305 m!179547))

(declare-fun m!179549 () Bool)

(assert (=> b!119305 m!179549))

(declare-fun m!179551 () Bool)

(assert (=> b!119305 m!179551))

(declare-fun m!179553 () Bool)

(assert (=> b!119301 m!179553))

(assert (=> b!119301 m!179109))

(declare-fun m!179555 () Bool)

(assert (=> b!119297 m!179555))

(declare-fun m!179557 () Bool)

(assert (=> b!119302 m!179557))

(declare-fun m!179559 () Bool)

(assert (=> b!119296 m!179559))

(declare-fun m!179561 () Bool)

(assert (=> b!119294 m!179561))

(assert (=> b!119294 m!179109))

(declare-fun m!179563 () Bool)

(assert (=> b!119306 m!179563))

(declare-fun m!179565 () Bool)

(assert (=> b!119306 m!179565))

(declare-fun m!179567 () Bool)

(assert (=> b!119306 m!179567))

(declare-fun m!179569 () Bool)

(assert (=> b!119306 m!179569))

(declare-fun m!179571 () Bool)

(assert (=> b!119306 m!179571))

(declare-fun m!179573 () Bool)

(assert (=> b!119306 m!179573))

(declare-fun m!179575 () Bool)

(assert (=> b!119306 m!179575))

(declare-fun m!179577 () Bool)

(assert (=> b!119306 m!179577))

(declare-fun m!179579 () Bool)

(assert (=> b!119306 m!179579))

(declare-fun m!179581 () Bool)

(assert (=> b!119306 m!179581))

(declare-fun m!179583 () Bool)

(assert (=> b!119306 m!179583))

(declare-fun m!179585 () Bool)

(assert (=> b!119306 m!179585))

(assert (=> b!119306 m!179109))

(declare-fun m!179587 () Bool)

(assert (=> b!119306 m!179587))

(assert (=> b!119306 m!179583))

(declare-fun m!179589 () Bool)

(assert (=> b!119306 m!179589))

(declare-fun m!179591 () Bool)

(assert (=> b!119306 m!179591))

(declare-fun m!179593 () Bool)

(assert (=> b!119306 m!179593))

(declare-fun m!179595 () Bool)

(assert (=> b!119306 m!179595))

(declare-fun m!179597 () Bool)

(assert (=> b!119306 m!179597))

(declare-fun m!179599 () Bool)

(assert (=> b!119306 m!179599))

(declare-fun m!179601 () Bool)

(assert (=> b!119306 m!179601))

(assert (=> b!119306 m!179551))

(declare-fun m!179603 () Bool)

(assert (=> b!119306 m!179603))

(declare-fun m!179605 () Bool)

(assert (=> b!119306 m!179605))

(declare-fun m!179607 () Bool)

(assert (=> b!119306 m!179607))

(declare-fun m!179609 () Bool)

(assert (=> b!119306 m!179609))

(declare-fun m!179611 () Bool)

(assert (=> b!119306 m!179611))

(declare-fun m!179613 () Bool)

(assert (=> b!119306 m!179613))

(declare-fun m!179615 () Bool)

(assert (=> b!119303 m!179615))

(assert (=> b!119303 m!179615))

(declare-fun m!179617 () Bool)

(assert (=> b!119303 m!179617))

(declare-fun m!179619 () Bool)

(assert (=> b!119295 m!179619))

(assert (=> b!119295 m!179561))

(declare-fun m!179621 () Bool)

(assert (=> b!119304 m!179621))

(declare-fun m!179623 () Bool)

(assert (=> bm!1544 m!179623))

(assert (=> b!119037 d!38144))

(declare-fun d!38218 () Bool)

(declare-fun e!78176 () Bool)

(assert (=> d!38218 e!78176))

(declare-fun res!98751 () Bool)

(assert (=> d!38218 (=> (not res!98751) (not e!78176))))

(declare-fun lt!184385 () (_ BitVec 64))

(declare-fun lt!184383 () (_ BitVec 64))

(declare-fun lt!184384 () (_ BitVec 64))

(assert (=> d!38218 (= res!98751 (= lt!184385 (bvsub lt!184384 lt!184383)))))

(assert (=> d!38218 (or (= (bvand lt!184384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184383 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184384 lt!184383) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38218 (= lt!184383 (remainingBits!0 ((_ sign_extend 32) (size!2416 (buf!2838 (_1!5253 lt!183675)))) ((_ sign_extend 32) (currentByte!5499 (_1!5253 lt!183675))) ((_ sign_extend 32) (currentBit!5494 (_1!5253 lt!183675)))))))

(declare-fun lt!184386 () (_ BitVec 64))

(declare-fun lt!184381 () (_ BitVec 64))

(assert (=> d!38218 (= lt!184384 (bvmul lt!184386 lt!184381))))

(assert (=> d!38218 (or (= lt!184386 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184381 (bvsdiv (bvmul lt!184386 lt!184381) lt!184386)))))

(assert (=> d!38218 (= lt!184381 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38218 (= lt!184386 ((_ sign_extend 32) (size!2416 (buf!2838 (_1!5253 lt!183675)))))))

(assert (=> d!38218 (= lt!184385 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5499 (_1!5253 lt!183675))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5494 (_1!5253 lt!183675)))))))

(assert (=> d!38218 (invariant!0 (currentBit!5494 (_1!5253 lt!183675)) (currentByte!5499 (_1!5253 lt!183675)) (size!2416 (buf!2838 (_1!5253 lt!183675))))))

(assert (=> d!38218 (= (bitIndex!0 (size!2416 (buf!2838 (_1!5253 lt!183675))) (currentByte!5499 (_1!5253 lt!183675)) (currentBit!5494 (_1!5253 lt!183675))) lt!184385)))

(declare-fun b!119307 () Bool)

(declare-fun res!98752 () Bool)

(assert (=> b!119307 (=> (not res!98752) (not e!78176))))

(assert (=> b!119307 (= res!98752 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184385))))

(declare-fun b!119308 () Bool)

(declare-fun lt!184382 () (_ BitVec 64))

(assert (=> b!119308 (= e!78176 (bvsle lt!184385 (bvmul lt!184382 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119308 (or (= lt!184382 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184382 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184382)))))

(assert (=> b!119308 (= lt!184382 ((_ sign_extend 32) (size!2416 (buf!2838 (_1!5253 lt!183675)))))))

(assert (= (and d!38218 res!98751) b!119307))

(assert (= (and b!119307 res!98752) b!119308))

(declare-fun m!179625 () Bool)

(assert (=> d!38218 m!179625))

(declare-fun m!179627 () Bool)

(assert (=> d!38218 m!179627))

(assert (=> b!119037 d!38218))

(declare-fun d!38220 () Bool)

(declare-fun lt!184387 () tuple2!10002)

(assert (=> d!38220 (= lt!184387 (readBit!0 (_1!5255 lt!183689)))))

(assert (=> d!38220 (= (readBitPure!0 (_1!5255 lt!183689)) (tuple2!9977 (_2!5266 lt!184387) (_1!5266 lt!184387)))))

(declare-fun bs!9249 () Bool)

(assert (= bs!9249 d!38220))

(declare-fun m!179629 () Bool)

(assert (=> bs!9249 m!179629))

(assert (=> b!119037 d!38220))

(declare-fun d!38222 () Bool)

(assert (=> d!38222 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183674)))) ((_ sign_extend 32) (currentByte!5499 (_2!5254 lt!183685))) ((_ sign_extend 32) (currentBit!5494 (_2!5254 lt!183685))) lt!183693) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183674)))) ((_ sign_extend 32) (currentByte!5499 (_2!5254 lt!183685))) ((_ sign_extend 32) (currentBit!5494 (_2!5254 lt!183685)))) lt!183693))))

(declare-fun bs!9250 () Bool)

(assert (= bs!9250 d!38222))

(declare-fun m!179631 () Bool)

(assert (=> bs!9250 m!179631))

(assert (=> b!119037 d!38222))

(declare-fun d!38224 () Bool)

(assert (=> d!38224 (isPrefixOf!0 thiss!1305 (_2!5254 lt!183674))))

(declare-fun lt!184390 () Unit!7327)

(declare-fun choose!30 (BitStream!4306 BitStream!4306 BitStream!4306) Unit!7327)

(assert (=> d!38224 (= lt!184390 (choose!30 thiss!1305 (_2!5254 lt!183685) (_2!5254 lt!183674)))))

(assert (=> d!38224 (isPrefixOf!0 thiss!1305 (_2!5254 lt!183685))))

(assert (=> d!38224 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5254 lt!183685) (_2!5254 lt!183674)) lt!184390)))

(declare-fun bs!9251 () Bool)

(assert (= bs!9251 d!38224))

(assert (=> bs!9251 m!179083))

(declare-fun m!179633 () Bool)

(assert (=> bs!9251 m!179633))

(assert (=> bs!9251 m!179113))

(assert (=> b!119037 d!38224))

(declare-fun d!38226 () Bool)

(declare-fun lt!184391 () tuple2!10000)

(assert (=> d!38226 (= lt!184391 (readNLeastSignificantBitsLoop!0 (_1!5255 lt!183679) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183671))))

(assert (=> d!38226 (= (readNLeastSignificantBitsLoopPure!0 (_1!5255 lt!183679) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183671) (tuple2!9983 (_2!5265 lt!184391) (_1!5265 lt!184391)))))

(declare-fun bs!9252 () Bool)

(assert (= bs!9252 d!38226))

(declare-fun m!179635 () Bool)

(assert (=> bs!9252 m!179635))

(assert (=> b!119037 d!38226))

(declare-fun d!38228 () Bool)

(assert (=> d!38228 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183674)))) ((_ sign_extend 32) (currentByte!5499 thiss!1305)) ((_ sign_extend 32) (currentBit!5494 thiss!1305)) lt!183692) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183674)))) ((_ sign_extend 32) (currentByte!5499 thiss!1305)) ((_ sign_extend 32) (currentBit!5494 thiss!1305))) lt!183692))))

(declare-fun bs!9253 () Bool)

(assert (= bs!9253 d!38228))

(declare-fun m!179637 () Bool)

(assert (=> bs!9253 m!179637))

(assert (=> b!119037 d!38228))

(declare-fun d!38230 () Bool)

(declare-fun e!78179 () Bool)

(assert (=> d!38230 e!78179))

(declare-fun res!98755 () Bool)

(assert (=> d!38230 (=> (not res!98755) (not e!78179))))

(declare-fun lt!184397 () (_ BitVec 64))

(declare-fun lt!184396 () BitStream!4306)

(assert (=> d!38230 (= res!98755 (= (bvadd lt!184397 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2416 (buf!2838 lt!184396)) (currentByte!5499 lt!184396) (currentBit!5494 lt!184396))))))

(assert (=> d!38230 (or (not (= (bvand lt!184397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!184397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!184397 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38230 (= lt!184397 (bitIndex!0 (size!2416 (buf!2838 (_1!5255 lt!183689))) (currentByte!5499 (_1!5255 lt!183689)) (currentBit!5494 (_1!5255 lt!183689))))))

(declare-fun moveBitIndex!0 (BitStream!4306 (_ BitVec 64)) tuple2!9978)

(assert (=> d!38230 (= lt!184396 (_2!5254 (moveBitIndex!0 (_1!5255 lt!183689) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4306 (_ BitVec 64)) Bool)

(assert (=> d!38230 (moveBitIndexPrecond!0 (_1!5255 lt!183689) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38230 (= (withMovedBitIndex!0 (_1!5255 lt!183689) #b0000000000000000000000000000000000000000000000000000000000000001) lt!184396)))

(declare-fun b!119311 () Bool)

(assert (=> b!119311 (= e!78179 (= (size!2416 (buf!2838 (_1!5255 lt!183689))) (size!2416 (buf!2838 lt!184396))))))

(assert (= (and d!38230 res!98755) b!119311))

(declare-fun m!179639 () Bool)

(assert (=> d!38230 m!179639))

(declare-fun m!179641 () Bool)

(assert (=> d!38230 m!179641))

(declare-fun m!179643 () Bool)

(assert (=> d!38230 m!179643))

(declare-fun m!179645 () Bool)

(assert (=> d!38230 m!179645))

(assert (=> b!119036 d!38230))

(declare-fun d!38232 () Bool)

(declare-fun lt!184415 () tuple2!9982)

(declare-fun lt!184410 () tuple2!9982)

(assert (=> d!38232 (and (= (_2!5256 lt!184415) (_2!5256 lt!184410)) (= (_1!5256 lt!184415) (_1!5256 lt!184410)))))

(declare-fun lt!184412 () (_ BitVec 64))

(declare-fun lt!184413 () Bool)

(declare-fun lt!184411 () BitStream!4306)

(declare-fun lt!184414 () Unit!7327)

(declare-fun choose!45 (BitStream!4306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9982 tuple2!9982 BitStream!4306 (_ BitVec 64) Bool BitStream!4306 (_ BitVec 64) tuple2!9982 tuple2!9982 BitStream!4306 (_ BitVec 64)) Unit!7327)

(assert (=> d!38232 (= lt!184414 (choose!45 (_1!5255 lt!183689) nBits!396 i!615 lt!183690 lt!184415 (tuple2!9983 (_1!5256 lt!184415) (_2!5256 lt!184415)) (_1!5256 lt!184415) (_2!5256 lt!184415) lt!184413 lt!184411 lt!184412 lt!184410 (tuple2!9983 (_1!5256 lt!184410) (_2!5256 lt!184410)) (_1!5256 lt!184410) (_2!5256 lt!184410)))))

(assert (=> d!38232 (= lt!184410 (readNLeastSignificantBitsLoopPure!0 lt!184411 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!184412))))

(assert (=> d!38232 (= lt!184412 (bvor lt!183690 (ite lt!184413 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38232 (= lt!184411 (withMovedBitIndex!0 (_1!5255 lt!183689) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38232 (= lt!184413 (_2!5253 (readBitPure!0 (_1!5255 lt!183689))))))

(assert (=> d!38232 (= lt!184415 (readNLeastSignificantBitsLoopPure!0 (_1!5255 lt!183689) nBits!396 i!615 lt!183690))))

(assert (=> d!38232 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5255 lt!183689) nBits!396 i!615 lt!183690) lt!184414)))

(declare-fun bs!9255 () Bool)

(assert (= bs!9255 d!38232))

(assert (=> bs!9255 m!179099))

(assert (=> bs!9255 m!179069))

(assert (=> bs!9255 m!179059))

(declare-fun m!179647 () Bool)

(assert (=> bs!9255 m!179647))

(declare-fun m!179649 () Bool)

(assert (=> bs!9255 m!179649))

(assert (=> b!119036 d!38232))

(declare-fun d!38234 () Bool)

(declare-fun e!78180 () Bool)

(assert (=> d!38234 e!78180))

(declare-fun res!98756 () Bool)

(assert (=> d!38234 (=> (not res!98756) (not e!78180))))

(declare-fun lt!184417 () (_ BitVec 64))

(declare-fun lt!184416 () BitStream!4306)

(assert (=> d!38234 (= res!98756 (= (bvadd lt!184417 (bvsub (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)) (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183674))) (currentByte!5499 (_2!5254 lt!183674)) (currentBit!5494 (_2!5254 lt!183674))))) (bitIndex!0 (size!2416 (buf!2838 lt!184416)) (currentByte!5499 lt!184416) (currentBit!5494 lt!184416))))))

(assert (=> d!38234 (or (not (= (bvand lt!184417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)) (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183674))) (currentByte!5499 (_2!5254 lt!183674)) (currentBit!5494 (_2!5254 lt!183674)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!184417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!184417 (bvsub (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)) (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183674))) (currentByte!5499 (_2!5254 lt!183674)) (currentBit!5494 (_2!5254 lt!183674))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38234 (= lt!184417 (bitIndex!0 (size!2416 (buf!2838 (_2!5255 lt!183689))) (currentByte!5499 (_2!5255 lt!183689)) (currentBit!5494 (_2!5255 lt!183689))))))

(assert (=> d!38234 (= lt!184416 (_2!5254 (moveBitIndex!0 (_2!5255 lt!183689) (bvsub (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)) (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183674))) (currentByte!5499 (_2!5254 lt!183674)) (currentBit!5494 (_2!5254 lt!183674)))))))))

(assert (=> d!38234 (moveBitIndexPrecond!0 (_2!5255 lt!183689) (bvsub (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)) (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183674))) (currentByte!5499 (_2!5254 lt!183674)) (currentBit!5494 (_2!5254 lt!183674)))))))

(assert (=> d!38234 (= (withMovedBitIndex!0 (_2!5255 lt!183689) (bvsub (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)) (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183674))) (currentByte!5499 (_2!5254 lt!183674)) (currentBit!5494 (_2!5254 lt!183674))))) lt!184416)))

(declare-fun b!119312 () Bool)

(assert (=> b!119312 (= e!78180 (= (size!2416 (buf!2838 (_2!5255 lt!183689))) (size!2416 (buf!2838 lt!184416))))))

(assert (= (and d!38234 res!98756) b!119312))

(declare-fun m!179651 () Bool)

(assert (=> d!38234 m!179651))

(declare-fun m!179653 () Bool)

(assert (=> d!38234 m!179653))

(declare-fun m!179655 () Bool)

(assert (=> d!38234 m!179655))

(declare-fun m!179657 () Bool)

(assert (=> d!38234 m!179657))

(assert (=> b!119036 d!38234))

(declare-fun lt!184418 () tuple2!10000)

(declare-fun d!38236 () Bool)

(assert (=> d!38236 (= lt!184418 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5255 lt!183689) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183671))))

(assert (=> d!38236 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5255 lt!183689) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183671) (tuple2!9983 (_2!5265 lt!184418) (_1!5265 lt!184418)))))

(declare-fun bs!9256 () Bool)

(assert (= bs!9256 d!38236))

(assert (=> bs!9256 m!179099))

(declare-fun m!179659 () Bool)

(assert (=> bs!9256 m!179659))

(assert (=> b!119036 d!38236))

(declare-fun d!38238 () Bool)

(declare-fun e!78181 () Bool)

(assert (=> d!38238 e!78181))

(declare-fun res!98757 () Bool)

(assert (=> d!38238 (=> (not res!98757) (not e!78181))))

(declare-fun lt!184421 () (_ BitVec 64))

(declare-fun lt!184423 () (_ BitVec 64))

(declare-fun lt!184422 () (_ BitVec 64))

(assert (=> d!38238 (= res!98757 (= lt!184423 (bvsub lt!184422 lt!184421)))))

(assert (=> d!38238 (or (= (bvand lt!184422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184421 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184422 lt!184421) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38238 (= lt!184421 (remainingBits!0 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183674)))) ((_ sign_extend 32) (currentByte!5499 (_2!5254 lt!183674))) ((_ sign_extend 32) (currentBit!5494 (_2!5254 lt!183674)))))))

(declare-fun lt!184424 () (_ BitVec 64))

(declare-fun lt!184419 () (_ BitVec 64))

(assert (=> d!38238 (= lt!184422 (bvmul lt!184424 lt!184419))))

(assert (=> d!38238 (or (= lt!184424 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184419 (bvsdiv (bvmul lt!184424 lt!184419) lt!184424)))))

(assert (=> d!38238 (= lt!184419 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38238 (= lt!184424 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183674)))))))

(assert (=> d!38238 (= lt!184423 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5499 (_2!5254 lt!183674))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5494 (_2!5254 lt!183674)))))))

(assert (=> d!38238 (invariant!0 (currentBit!5494 (_2!5254 lt!183674)) (currentByte!5499 (_2!5254 lt!183674)) (size!2416 (buf!2838 (_2!5254 lt!183674))))))

(assert (=> d!38238 (= (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183674))) (currentByte!5499 (_2!5254 lt!183674)) (currentBit!5494 (_2!5254 lt!183674))) lt!184423)))

(declare-fun b!119313 () Bool)

(declare-fun res!98758 () Bool)

(assert (=> b!119313 (=> (not res!98758) (not e!78181))))

(assert (=> b!119313 (= res!98758 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184423))))

(declare-fun b!119314 () Bool)

(declare-fun lt!184420 () (_ BitVec 64))

(assert (=> b!119314 (= e!78181 (bvsle lt!184423 (bvmul lt!184420 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119314 (or (= lt!184420 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184420 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184420)))))

(assert (=> b!119314 (= lt!184420 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183674)))))))

(assert (= (and d!38238 res!98757) b!119313))

(assert (= (and b!119313 res!98758) b!119314))

(declare-fun m!179661 () Bool)

(assert (=> d!38238 m!179661))

(declare-fun m!179663 () Bool)

(assert (=> d!38238 m!179663))

(assert (=> b!119036 d!38238))

(declare-fun d!38240 () Bool)

(declare-fun e!78182 () Bool)

(assert (=> d!38240 e!78182))

(declare-fun res!98759 () Bool)

(assert (=> d!38240 (=> (not res!98759) (not e!78182))))

(declare-fun lt!184427 () (_ BitVec 64))

(declare-fun lt!184429 () (_ BitVec 64))

(declare-fun lt!184428 () (_ BitVec 64))

(assert (=> d!38240 (= res!98759 (= lt!184429 (bvsub lt!184428 lt!184427)))))

(assert (=> d!38240 (or (= (bvand lt!184428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184427 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184428 lt!184427) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38240 (= lt!184427 (remainingBits!0 ((_ sign_extend 32) (size!2416 (buf!2838 thiss!1305))) ((_ sign_extend 32) (currentByte!5499 thiss!1305)) ((_ sign_extend 32) (currentBit!5494 thiss!1305))))))

(declare-fun lt!184430 () (_ BitVec 64))

(declare-fun lt!184425 () (_ BitVec 64))

(assert (=> d!38240 (= lt!184428 (bvmul lt!184430 lt!184425))))

(assert (=> d!38240 (or (= lt!184430 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184425 (bvsdiv (bvmul lt!184430 lt!184425) lt!184430)))))

(assert (=> d!38240 (= lt!184425 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38240 (= lt!184430 ((_ sign_extend 32) (size!2416 (buf!2838 thiss!1305))))))

(assert (=> d!38240 (= lt!184429 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5499 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5494 thiss!1305))))))

(assert (=> d!38240 (invariant!0 (currentBit!5494 thiss!1305) (currentByte!5499 thiss!1305) (size!2416 (buf!2838 thiss!1305)))))

(assert (=> d!38240 (= (bitIndex!0 (size!2416 (buf!2838 thiss!1305)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)) lt!184429)))

(declare-fun b!119315 () Bool)

(declare-fun res!98760 () Bool)

(assert (=> b!119315 (=> (not res!98760) (not e!78182))))

(assert (=> b!119315 (= res!98760 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184429))))

(declare-fun b!119316 () Bool)

(declare-fun lt!184426 () (_ BitVec 64))

(assert (=> b!119316 (= e!78182 (bvsle lt!184429 (bvmul lt!184426 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119316 (or (= lt!184426 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184426 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184426)))))

(assert (=> b!119316 (= lt!184426 ((_ sign_extend 32) (size!2416 (buf!2838 thiss!1305))))))

(assert (= (and d!38240 res!98759) b!119315))

(assert (= (and b!119315 res!98760) b!119316))

(assert (=> d!38240 m!179269))

(declare-fun m!179665 () Bool)

(assert (=> d!38240 m!179665))

(assert (=> b!119036 d!38240))

(declare-fun d!38242 () Bool)

(declare-fun lt!184431 () tuple2!10002)

(assert (=> d!38242 (= lt!184431 (readBit!0 (readerFrom!0 (_2!5254 lt!183685) (currentBit!5494 thiss!1305) (currentByte!5499 thiss!1305))))))

(assert (=> d!38242 (= (readBitPure!0 (readerFrom!0 (_2!5254 lt!183685) (currentBit!5494 thiss!1305) (currentByte!5499 thiss!1305))) (tuple2!9977 (_2!5266 lt!184431) (_1!5266 lt!184431)))))

(declare-fun bs!9257 () Bool)

(assert (= bs!9257 d!38242))

(assert (=> bs!9257 m!179119))

(declare-fun m!179667 () Bool)

(assert (=> bs!9257 m!179667))

(assert (=> b!119033 d!38242))

(declare-fun d!38244 () Bool)

(declare-fun e!78185 () Bool)

(assert (=> d!38244 e!78185))

(declare-fun res!98764 () Bool)

(assert (=> d!38244 (=> (not res!98764) (not e!78185))))

(assert (=> d!38244 (= res!98764 (invariant!0 (currentBit!5494 (_2!5254 lt!183685)) (currentByte!5499 (_2!5254 lt!183685)) (size!2416 (buf!2838 (_2!5254 lt!183685)))))))

(assert (=> d!38244 (= (readerFrom!0 (_2!5254 lt!183685) (currentBit!5494 thiss!1305) (currentByte!5499 thiss!1305)) (BitStream!4307 (buf!2838 (_2!5254 lt!183685)) (currentByte!5499 thiss!1305) (currentBit!5494 thiss!1305)))))

(declare-fun b!119319 () Bool)

(assert (=> b!119319 (= e!78185 (invariant!0 (currentBit!5494 thiss!1305) (currentByte!5499 thiss!1305) (size!2416 (buf!2838 (_2!5254 lt!183685)))))))

(assert (= (and d!38244 res!98764) b!119319))

(declare-fun m!179669 () Bool)

(assert (=> d!38244 m!179669))

(assert (=> b!119319 m!179093))

(assert (=> b!119033 d!38244))

(declare-fun d!38246 () Bool)

(declare-fun e!78186 () Bool)

(assert (=> d!38246 e!78186))

(declare-fun res!98765 () Bool)

(assert (=> d!38246 (=> (not res!98765) (not e!78186))))

(declare-fun lt!184434 () (_ BitVec 64))

(declare-fun lt!184435 () (_ BitVec 64))

(declare-fun lt!184436 () (_ BitVec 64))

(assert (=> d!38246 (= res!98765 (= lt!184436 (bvsub lt!184435 lt!184434)))))

(assert (=> d!38246 (or (= (bvand lt!184435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184434 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184435 lt!184434) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38246 (= lt!184434 (remainingBits!0 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183685)))) ((_ sign_extend 32) (currentByte!5499 (_2!5254 lt!183685))) ((_ sign_extend 32) (currentBit!5494 (_2!5254 lt!183685)))))))

(declare-fun lt!184437 () (_ BitVec 64))

(declare-fun lt!184432 () (_ BitVec 64))

(assert (=> d!38246 (= lt!184435 (bvmul lt!184437 lt!184432))))

(assert (=> d!38246 (or (= lt!184437 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184432 (bvsdiv (bvmul lt!184437 lt!184432) lt!184437)))))

(assert (=> d!38246 (= lt!184432 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38246 (= lt!184437 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183685)))))))

(assert (=> d!38246 (= lt!184436 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5499 (_2!5254 lt!183685))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5494 (_2!5254 lt!183685)))))))

(assert (=> d!38246 (invariant!0 (currentBit!5494 (_2!5254 lt!183685)) (currentByte!5499 (_2!5254 lt!183685)) (size!2416 (buf!2838 (_2!5254 lt!183685))))))

(assert (=> d!38246 (= (bitIndex!0 (size!2416 (buf!2838 (_2!5254 lt!183685))) (currentByte!5499 (_2!5254 lt!183685)) (currentBit!5494 (_2!5254 lt!183685))) lt!184436)))

(declare-fun b!119320 () Bool)

(declare-fun res!98766 () Bool)

(assert (=> b!119320 (=> (not res!98766) (not e!78186))))

(assert (=> b!119320 (= res!98766 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184436))))

(declare-fun b!119321 () Bool)

(declare-fun lt!184433 () (_ BitVec 64))

(assert (=> b!119321 (= e!78186 (bvsle lt!184436 (bvmul lt!184433 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119321 (or (= lt!184433 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184433 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184433)))))

(assert (=> b!119321 (= lt!184433 ((_ sign_extend 32) (size!2416 (buf!2838 (_2!5254 lt!183685)))))))

(assert (= (and d!38246 res!98765) b!119320))

(assert (= (and b!119320 res!98766) b!119321))

(declare-fun m!179671 () Bool)

(assert (=> d!38246 m!179671))

(assert (=> d!38246 m!179669))

(assert (=> b!119032 d!38246))

(assert (=> b!119032 d!38240))

(declare-fun d!38248 () Bool)

(assert (=> d!38248 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5494 thiss!1305) (currentByte!5499 thiss!1305) (size!2416 (buf!2838 thiss!1305))))))

(declare-fun bs!9258 () Bool)

(assert (= bs!9258 d!38248))

(assert (=> bs!9258 m!179665))

(assert (=> start!23450 d!38248))

(declare-fun d!38250 () Bool)

(declare-fun e!78187 () Bool)

(assert (=> d!38250 e!78187))

(declare-fun res!98767 () Bool)

(assert (=> d!38250 (=> (not res!98767) (not e!78187))))

(declare-fun lt!184440 () (_ BitVec 64))

(declare-fun lt!184442 () (_ BitVec 64))

(declare-fun lt!184441 () (_ BitVec 64))

(assert (=> d!38250 (= res!98767 (= lt!184442 (bvsub lt!184441 lt!184440)))))

(assert (=> d!38250 (or (= (bvand lt!184441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184440 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184441 lt!184440) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38250 (= lt!184440 (remainingBits!0 ((_ sign_extend 32) (size!2416 (buf!2838 (_1!5253 lt!183670)))) ((_ sign_extend 32) (currentByte!5499 (_1!5253 lt!183670))) ((_ sign_extend 32) (currentBit!5494 (_1!5253 lt!183670)))))))

(declare-fun lt!184443 () (_ BitVec 64))

(declare-fun lt!184438 () (_ BitVec 64))

(assert (=> d!38250 (= lt!184441 (bvmul lt!184443 lt!184438))))

(assert (=> d!38250 (or (= lt!184443 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184438 (bvsdiv (bvmul lt!184443 lt!184438) lt!184443)))))

(assert (=> d!38250 (= lt!184438 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38250 (= lt!184443 ((_ sign_extend 32) (size!2416 (buf!2838 (_1!5253 lt!183670)))))))

(assert (=> d!38250 (= lt!184442 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5499 (_1!5253 lt!183670))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5494 (_1!5253 lt!183670)))))))

(assert (=> d!38250 (invariant!0 (currentBit!5494 (_1!5253 lt!183670)) (currentByte!5499 (_1!5253 lt!183670)) (size!2416 (buf!2838 (_1!5253 lt!183670))))))

(assert (=> d!38250 (= (bitIndex!0 (size!2416 (buf!2838 (_1!5253 lt!183670))) (currentByte!5499 (_1!5253 lt!183670)) (currentBit!5494 (_1!5253 lt!183670))) lt!184442)))

(declare-fun b!119322 () Bool)

(declare-fun res!98768 () Bool)

(assert (=> b!119322 (=> (not res!98768) (not e!78187))))

(assert (=> b!119322 (= res!98768 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184442))))

(declare-fun b!119323 () Bool)

(declare-fun lt!184439 () (_ BitVec 64))

(assert (=> b!119323 (= e!78187 (bvsle lt!184442 (bvmul lt!184439 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119323 (or (= lt!184439 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184439 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184439)))))

(assert (=> b!119323 (= lt!184439 ((_ sign_extend 32) (size!2416 (buf!2838 (_1!5253 lt!183670)))))))

(assert (= (and d!38250 res!98767) b!119322))

(assert (= (and b!119322 res!98768) b!119323))

(declare-fun m!179673 () Bool)

(assert (=> d!38250 m!179673))

(declare-fun m!179675 () Bool)

(assert (=> d!38250 m!179675))

(assert (=> b!119030 d!38250))

(declare-fun d!38252 () Bool)

(assert (=> d!38252 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!119041 d!38252))

(declare-fun d!38254 () Bool)

(assert (=> d!38254 (= (invariant!0 (currentBit!5494 thiss!1305) (currentByte!5499 thiss!1305) (size!2416 (buf!2838 (_2!5254 lt!183685)))) (and (bvsge (currentBit!5494 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5494 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5499 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5499 thiss!1305) (size!2416 (buf!2838 (_2!5254 lt!183685)))) (and (= (currentBit!5494 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5499 thiss!1305) (size!2416 (buf!2838 (_2!5254 lt!183685))))))))))

(assert (=> b!119040 d!38254))

(declare-fun d!38256 () Bool)

(assert (=> d!38256 (= (array_inv!2218 (buf!2838 thiss!1305)) (bvsge (size!2416 (buf!2838 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!119031 d!38256))

(push 1)

(assert (not d!38138))

(assert (not d!38136))

(assert (not b!119171))

(assert (not b!119149))

(assert (not d!38222))

(assert (not b!119162))

(assert (not b!119160))

(assert (not d!38250))

(assert (not b!119144))

(assert (not d!38132))

(assert (not bm!1544))

(assert (not b!119169))

(assert (not d!38228))

(assert (not b!119302))

(assert (not d!38126))

(assert (not d!38230))

(assert (not b!119296))

(assert (not d!38226))

(assert (not d!38224))

(assert (not b!119161))

(assert (not d!38142))

(assert (not b!119172))

(assert (not b!119142))

(assert (not d!38242))

(assert (not b!119126))

(assert (not d!38140))

(assert (not d!38232))

(assert (not b!119297))

(assert (not d!38220))

(assert (not d!38248))

(assert (not d!38238))

(assert (not d!38124))

(assert (not d!38130))

(assert (not d!38234))

(assert (not b!119295))

(assert (not b!119304))

(assert (not b!119159))

(assert (not d!38240))

(assert (not b!119170))

(assert (not d!38134))

(assert (not b!119128))

(assert (not d!38122))

(assert (not b!119147))

(assert (not b!119145))

(assert (not d!38236))

(assert (not d!38218))

(assert (not b!119303))

(assert (not b!119301))

(assert (not b!119305))

(assert (not d!38246))

(assert (not b!119294))

(assert (not b!119306))

(assert (not d!38244))

(assert (not b!119319))

(assert (not d!38118))

(assert (not b!119143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

