; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23682 () Bool)

(assert start!23682)

(declare-fun b!120001 () Bool)

(declare-fun e!78618 () Bool)

(declare-datatypes ((array!5352 0))(
  ( (array!5353 (arr!3017 (Array (_ BitVec 32) (_ BitVec 8))) (size!2424 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4322 0))(
  ( (BitStream!4323 (buf!2852 array!5352) (currentByte!5525 (_ BitVec 32)) (currentBit!5520 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4322)

(declare-datatypes ((Unit!7391 0))(
  ( (Unit!7392) )
))
(declare-datatypes ((tuple2!10064 0))(
  ( (tuple2!10065 (_1!5297 Unit!7391) (_2!5297 BitStream!4322)) )
))
(declare-fun lt!186308 () tuple2!10064)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!120001 (= e!78618 (invariant!0 (currentBit!5520 thiss!1305) (currentByte!5525 thiss!1305) (size!2424 (buf!2852 (_2!5297 lt!186308)))))))

(declare-fun b!120002 () Bool)

(declare-fun e!78616 () Bool)

(declare-datatypes ((tuple2!10066 0))(
  ( (tuple2!10067 (_1!5298 BitStream!4322) (_2!5298 Bool)) )
))
(declare-fun lt!186295 () tuple2!10066)

(declare-fun lt!186306 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120002 (= e!78616 (= (bitIndex!0 (size!2424 (buf!2852 (_1!5298 lt!186295))) (currentByte!5525 (_1!5298 lt!186295)) (currentBit!5520 (_1!5298 lt!186295))) lt!186306))))

(declare-fun lt!186285 () tuple2!10064)

(declare-fun lt!186298 () (_ BitVec 64))

(declare-datatypes ((tuple2!10068 0))(
  ( (tuple2!10069 (_1!5299 BitStream!4322) (_2!5299 BitStream!4322)) )
))
(declare-fun lt!186307 () tuple2!10068)

(declare-fun e!78624 () Bool)

(declare-fun b!120003 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4322 (_ BitVec 64)) BitStream!4322)

(assert (=> b!120003 (= e!78624 (= (_1!5299 lt!186307) (withMovedBitIndex!0 (_2!5299 lt!186307) (bvsub (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))) lt!186298))))))

(declare-fun lt!186301 () tuple2!10068)

(declare-fun lt!186294 () (_ BitVec 64))

(assert (=> b!120003 (= (_1!5299 lt!186301) (withMovedBitIndex!0 (_2!5299 lt!186301) (bvsub lt!186294 lt!186298)))))

(assert (=> b!120003 (= lt!186298 (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186308))) (currentByte!5525 (_2!5297 lt!186308)) (currentBit!5520 (_2!5297 lt!186308))))))

(assert (=> b!120003 (= lt!186294 (bitIndex!0 (size!2424 (buf!2852 thiss!1305)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305)))))

(declare-datatypes ((tuple2!10070 0))(
  ( (tuple2!10071 (_1!5300 BitStream!4322) (_2!5300 (_ BitVec 64))) )
))
(declare-fun lt!186293 () tuple2!10070)

(declare-fun lt!186286 () tuple2!10070)

(assert (=> b!120003 (and (= (_2!5300 lt!186293) (_2!5300 lt!186286)) (= (_1!5300 lt!186293) (_1!5300 lt!186286)))))

(declare-fun lt!186304 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!186297 () Unit!7391)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7391)

(assert (=> b!120003 (= lt!186297 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5299 lt!186301) nBits!396 i!615 lt!186304))))

(declare-fun lt!186299 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10070)

(assert (=> b!120003 (= lt!186286 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5299 lt!186301) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186299))))

(declare-fun b!120004 () Bool)

(declare-fun e!78617 () Bool)

(declare-fun lt!186287 () tuple2!10066)

(declare-fun lt!186305 () tuple2!10066)

(assert (=> b!120004 (= e!78617 (= (_2!5298 lt!186287) (_2!5298 lt!186305)))))

(declare-fun b!120005 () Bool)

(declare-fun res!99354 () Bool)

(declare-fun e!78619 () Bool)

(assert (=> b!120005 (=> (not res!99354) (not e!78619))))

(declare-fun isPrefixOf!0 (BitStream!4322 BitStream!4322) Bool)

(assert (=> b!120005 (= res!99354 (isPrefixOf!0 thiss!1305 (_2!5297 lt!186285)))))

(declare-fun b!120006 () Bool)

(declare-fun e!78622 () Bool)

(declare-fun e!78620 () Bool)

(assert (=> b!120006 (= e!78622 e!78620)))

(declare-fun res!99347 () Bool)

(assert (=> b!120006 (=> (not res!99347) (not e!78620))))

(declare-fun lt!186296 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120006 (= res!99347 (validate_offset_bits!1 ((_ sign_extend 32) (size!2424 (buf!2852 thiss!1305))) ((_ sign_extend 32) (currentByte!5525 thiss!1305)) ((_ sign_extend 32) (currentBit!5520 thiss!1305)) lt!186296))))

(assert (=> b!120006 (= lt!186296 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!120007 () Bool)

(declare-fun res!99344 () Bool)

(assert (=> b!120007 (=> (not res!99344) (not e!78618))))

(assert (=> b!120007 (= res!99344 (invariant!0 (currentBit!5520 thiss!1305) (currentByte!5525 thiss!1305) (size!2424 (buf!2852 (_2!5297 lt!186285)))))))

(declare-fun b!120008 () Bool)

(declare-fun res!99345 () Bool)

(assert (=> b!120008 (=> (not res!99345) (not e!78620))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120008 (= res!99345 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!120009 () Bool)

(assert (=> b!120009 (= e!78619 e!78616)))

(declare-fun res!99349 () Bool)

(assert (=> b!120009 (=> (not res!99349) (not e!78616))))

(declare-fun lt!186292 () Bool)

(assert (=> b!120009 (= res!99349 (and (= (_2!5298 lt!186295) lt!186292) (= (_1!5298 lt!186295) (_2!5297 lt!186285))))))

(declare-fun readBitPure!0 (BitStream!4322) tuple2!10066)

(declare-fun readerFrom!0 (BitStream!4322 (_ BitVec 32) (_ BitVec 32)) BitStream!4322)

(assert (=> b!120009 (= lt!186295 (readBitPure!0 (readerFrom!0 (_2!5297 lt!186285) (currentBit!5520 thiss!1305) (currentByte!5525 thiss!1305))))))

(declare-fun b!120010 () Bool)

(assert (=> b!120010 (= e!78620 (not e!78624))))

(declare-fun res!99351 () Bool)

(assert (=> b!120010 (=> res!99351 e!78624)))

(assert (=> b!120010 (= res!99351 (not (= (_1!5300 (readNLeastSignificantBitsLoopPure!0 (_1!5299 lt!186307) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186299)) (_2!5299 lt!186307))))))

(declare-fun lt!186291 () (_ BitVec 64))

(assert (=> b!120010 (validate_offset_bits!1 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186308)))) ((_ sign_extend 32) (currentByte!5525 (_2!5297 lt!186285))) ((_ sign_extend 32) (currentBit!5520 (_2!5297 lt!186285))) lt!186291)))

(declare-fun lt!186289 () Unit!7391)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4322 array!5352 (_ BitVec 64)) Unit!7391)

(assert (=> b!120010 (= lt!186289 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5297 lt!186285) (buf!2852 (_2!5297 lt!186308)) lt!186291))))

(assert (=> b!120010 (= lt!186291 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!186290 () (_ BitVec 64))

(declare-fun lt!186284 () tuple2!10066)

(assert (=> b!120010 (= lt!186299 (bvor lt!186304 (ite (_2!5298 lt!186284) lt!186290 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120010 (= lt!186293 (readNLeastSignificantBitsLoopPure!0 (_1!5299 lt!186301) nBits!396 i!615 lt!186304))))

(assert (=> b!120010 (validate_offset_bits!1 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186308)))) ((_ sign_extend 32) (currentByte!5525 thiss!1305)) ((_ sign_extend 32) (currentBit!5520 thiss!1305)) lt!186296)))

(declare-fun lt!186309 () Unit!7391)

(assert (=> b!120010 (= lt!186309 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2852 (_2!5297 lt!186308)) lt!186296))))

(assert (=> b!120010 (= lt!186304 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!120010 (= (_2!5298 lt!186284) lt!186292)))

(assert (=> b!120010 (= lt!186284 (readBitPure!0 (_1!5299 lt!186301)))))

(declare-fun reader!0 (BitStream!4322 BitStream!4322) tuple2!10068)

(assert (=> b!120010 (= lt!186307 (reader!0 (_2!5297 lt!186285) (_2!5297 lt!186308)))))

(assert (=> b!120010 (= lt!186301 (reader!0 thiss!1305 (_2!5297 lt!186308)))))

(assert (=> b!120010 e!78617))

(declare-fun res!99350 () Bool)

(assert (=> b!120010 (=> (not res!99350) (not e!78617))))

(assert (=> b!120010 (= res!99350 (= (bitIndex!0 (size!2424 (buf!2852 (_1!5298 lt!186287))) (currentByte!5525 (_1!5298 lt!186287)) (currentBit!5520 (_1!5298 lt!186287))) (bitIndex!0 (size!2424 (buf!2852 (_1!5298 lt!186305))) (currentByte!5525 (_1!5298 lt!186305)) (currentBit!5520 (_1!5298 lt!186305)))))))

(declare-fun lt!186300 () Unit!7391)

(declare-fun lt!186303 () BitStream!4322)

(declare-fun readBitPrefixLemma!0 (BitStream!4322 BitStream!4322) Unit!7391)

(assert (=> b!120010 (= lt!186300 (readBitPrefixLemma!0 lt!186303 (_2!5297 lt!186308)))))

(assert (=> b!120010 (= lt!186305 (readBitPure!0 (BitStream!4323 (buf!2852 (_2!5297 lt!186308)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305))))))

(assert (=> b!120010 (= lt!186287 (readBitPure!0 lt!186303))))

(assert (=> b!120010 (= lt!186303 (BitStream!4323 (buf!2852 (_2!5297 lt!186285)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305)))))

(assert (=> b!120010 e!78618))

(declare-fun res!99353 () Bool)

(assert (=> b!120010 (=> (not res!99353) (not e!78618))))

(assert (=> b!120010 (= res!99353 (isPrefixOf!0 thiss!1305 (_2!5297 lt!186308)))))

(declare-fun lt!186288 () Unit!7391)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4322 BitStream!4322 BitStream!4322) Unit!7391)

(assert (=> b!120010 (= lt!186288 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5297 lt!186285) (_2!5297 lt!186308)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4322 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10064)

(assert (=> b!120010 (= lt!186308 (appendNLeastSignificantBitsLoop!0 (_2!5297 lt!186285) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!78621 () Bool)

(assert (=> b!120010 e!78621))

(declare-fun res!99343 () Bool)

(assert (=> b!120010 (=> (not res!99343) (not e!78621))))

(assert (=> b!120010 (= res!99343 (= (size!2424 (buf!2852 thiss!1305)) (size!2424 (buf!2852 (_2!5297 lt!186285)))))))

(declare-fun appendBit!0 (BitStream!4322 Bool) tuple2!10064)

(assert (=> b!120010 (= lt!186285 (appendBit!0 thiss!1305 lt!186292))))

(assert (=> b!120010 (= lt!186292 (not (= (bvand v!199 lt!186290) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120010 (= lt!186290 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!120012 () Bool)

(assert (=> b!120012 (= e!78621 e!78619)))

(declare-fun res!99348 () Bool)

(assert (=> b!120012 (=> (not res!99348) (not e!78619))))

(declare-fun lt!186302 () (_ BitVec 64))

(assert (=> b!120012 (= res!99348 (= lt!186306 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!186302)))))

(assert (=> b!120012 (= lt!186306 (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))))))

(assert (=> b!120012 (= lt!186302 (bitIndex!0 (size!2424 (buf!2852 thiss!1305)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305)))))

(declare-fun b!120013 () Bool)

(declare-fun e!78615 () Bool)

(declare-fun array_inv!2226 (array!5352) Bool)

(assert (=> b!120013 (= e!78615 (array_inv!2226 (buf!2852 thiss!1305)))))

(declare-fun b!120011 () Bool)

(declare-fun res!99352 () Bool)

(assert (=> b!120011 (=> (not res!99352) (not e!78620))))

(assert (=> b!120011 (= res!99352 (bvslt i!615 nBits!396))))

(declare-fun res!99346 () Bool)

(assert (=> start!23682 (=> (not res!99346) (not e!78622))))

(assert (=> start!23682 (= res!99346 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23682 e!78622))

(assert (=> start!23682 true))

(declare-fun inv!12 (BitStream!4322) Bool)

(assert (=> start!23682 (and (inv!12 thiss!1305) e!78615)))

(assert (= (and start!23682 res!99346) b!120006))

(assert (= (and b!120006 res!99347) b!120008))

(assert (= (and b!120008 res!99345) b!120011))

(assert (= (and b!120011 res!99352) b!120010))

(assert (= (and b!120010 res!99343) b!120012))

(assert (= (and b!120012 res!99348) b!120005))

(assert (= (and b!120005 res!99354) b!120009))

(assert (= (and b!120009 res!99349) b!120002))

(assert (= (and b!120010 res!99353) b!120007))

(assert (= (and b!120007 res!99344) b!120001))

(assert (= (and b!120010 res!99350) b!120004))

(assert (= (and b!120010 (not res!99351)) b!120003))

(assert (= start!23682 b!120013))

(declare-fun m!181047 () Bool)

(assert (=> b!120010 m!181047))

(declare-fun m!181049 () Bool)

(assert (=> b!120010 m!181049))

(declare-fun m!181051 () Bool)

(assert (=> b!120010 m!181051))

(declare-fun m!181053 () Bool)

(assert (=> b!120010 m!181053))

(declare-fun m!181055 () Bool)

(assert (=> b!120010 m!181055))

(declare-fun m!181057 () Bool)

(assert (=> b!120010 m!181057))

(declare-fun m!181059 () Bool)

(assert (=> b!120010 m!181059))

(declare-fun m!181061 () Bool)

(assert (=> b!120010 m!181061))

(declare-fun m!181063 () Bool)

(assert (=> b!120010 m!181063))

(declare-fun m!181065 () Bool)

(assert (=> b!120010 m!181065))

(declare-fun m!181067 () Bool)

(assert (=> b!120010 m!181067))

(declare-fun m!181069 () Bool)

(assert (=> b!120010 m!181069))

(declare-fun m!181071 () Bool)

(assert (=> b!120010 m!181071))

(declare-fun m!181073 () Bool)

(assert (=> b!120010 m!181073))

(declare-fun m!181075 () Bool)

(assert (=> b!120010 m!181075))

(declare-fun m!181077 () Bool)

(assert (=> b!120010 m!181077))

(declare-fun m!181079 () Bool)

(assert (=> b!120010 m!181079))

(declare-fun m!181081 () Bool)

(assert (=> b!120010 m!181081))

(declare-fun m!181083 () Bool)

(assert (=> b!120010 m!181083))

(declare-fun m!181085 () Bool)

(assert (=> b!120003 m!181085))

(declare-fun m!181087 () Bool)

(assert (=> b!120003 m!181087))

(declare-fun m!181089 () Bool)

(assert (=> b!120003 m!181089))

(declare-fun m!181091 () Bool)

(assert (=> b!120003 m!181091))

(declare-fun m!181093 () Bool)

(assert (=> b!120003 m!181093))

(declare-fun m!181095 () Bool)

(assert (=> b!120003 m!181095))

(assert (=> b!120003 m!181095))

(declare-fun m!181097 () Bool)

(assert (=> b!120003 m!181097))

(declare-fun m!181099 () Bool)

(assert (=> b!120003 m!181099))

(declare-fun m!181101 () Bool)

(assert (=> b!120006 m!181101))

(declare-fun m!181103 () Bool)

(assert (=> b!120013 m!181103))

(assert (=> b!120012 m!181087))

(assert (=> b!120012 m!181089))

(declare-fun m!181105 () Bool)

(assert (=> b!120007 m!181105))

(declare-fun m!181107 () Bool)

(assert (=> b!120005 m!181107))

(declare-fun m!181109 () Bool)

(assert (=> start!23682 m!181109))

(declare-fun m!181111 () Bool)

(assert (=> b!120002 m!181111))

(declare-fun m!181113 () Bool)

(assert (=> b!120001 m!181113))

(declare-fun m!181115 () Bool)

(assert (=> b!120008 m!181115))

(declare-fun m!181117 () Bool)

(assert (=> b!120009 m!181117))

(assert (=> b!120009 m!181117))

(declare-fun m!181119 () Bool)

(assert (=> b!120009 m!181119))

(push 1)

(assert (not b!120010))

(assert (not b!120013))

(assert (not b!120002))

(assert (not b!120007))

(assert (not b!120009))

(assert (not b!120003))

(assert (not b!120006))

(assert (not b!120001))

(assert (not b!120005))

(assert (not b!120012))

(assert (not start!23682))

(assert (not b!120008))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!38572 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!38572 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2424 (buf!2852 thiss!1305))) ((_ sign_extend 32) (currentByte!5525 thiss!1305)) ((_ sign_extend 32) (currentBit!5520 thiss!1305)) lt!186296) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2424 (buf!2852 thiss!1305))) ((_ sign_extend 32) (currentByte!5525 thiss!1305)) ((_ sign_extend 32) (currentBit!5520 thiss!1305))) lt!186296))))

(declare-fun bs!9332 () Bool)

(assert (= bs!9332 d!38572))

(declare-fun m!181163 () Bool)

(assert (=> bs!9332 m!181163))

(assert (=> b!120006 d!38572))

(declare-fun d!38576 () Bool)

(declare-fun res!99378 () Bool)

(declare-fun e!78640 () Bool)

(assert (=> d!38576 (=> (not res!99378) (not e!78640))))

(assert (=> d!38576 (= res!99378 (= (size!2424 (buf!2852 thiss!1305)) (size!2424 (buf!2852 (_2!5297 lt!186285)))))))

(assert (=> d!38576 (= (isPrefixOf!0 thiss!1305 (_2!5297 lt!186285)) e!78640)))

(declare-fun b!120037 () Bool)

(declare-fun res!99379 () Bool)

(assert (=> b!120037 (=> (not res!99379) (not e!78640))))

(assert (=> b!120037 (= res!99379 (bvsle (bitIndex!0 (size!2424 (buf!2852 thiss!1305)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305)) (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285)))))))

(declare-fun b!120038 () Bool)

(declare-fun e!78641 () Bool)

(assert (=> b!120038 (= e!78640 e!78641)))

(declare-fun res!99380 () Bool)

(assert (=> b!120038 (=> res!99380 e!78641)))

(assert (=> b!120038 (= res!99380 (= (size!2424 (buf!2852 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!120039 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5352 array!5352 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120039 (= e!78641 (arrayBitRangesEq!0 (buf!2852 thiss!1305) (buf!2852 (_2!5297 lt!186285)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2424 (buf!2852 thiss!1305)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305))))))

(assert (= (and d!38576 res!99378) b!120037))

(assert (= (and b!120037 res!99379) b!120038))

(assert (= (and b!120038 (not res!99380)) b!120039))

(assert (=> b!120037 m!181089))

(assert (=> b!120037 m!181087))

(assert (=> b!120039 m!181089))

(assert (=> b!120039 m!181089))

(declare-fun m!181171 () Bool)

(assert (=> b!120039 m!181171))

(assert (=> b!120005 d!38576))

(declare-fun d!38582 () Bool)

(assert (=> d!38582 (= (invariant!0 (currentBit!5520 thiss!1305) (currentByte!5525 thiss!1305) (size!2424 (buf!2852 (_2!5297 lt!186285)))) (and (bvsge (currentBit!5520 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5520 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5525 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5525 thiss!1305) (size!2424 (buf!2852 (_2!5297 lt!186285)))) (and (= (currentBit!5520 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5525 thiss!1305) (size!2424 (buf!2852 (_2!5297 lt!186285))))))))))

(assert (=> b!120007 d!38582))

(declare-fun d!38584 () Bool)

(assert (=> d!38584 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!120008 d!38584))

(declare-fun d!38586 () Bool)

(assert (=> d!38586 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!120010 d!38586))

(declare-fun d!38588 () Bool)

(declare-datatypes ((tuple2!10074 0))(
  ( (tuple2!10075 (_1!5302 Bool) (_2!5302 BitStream!4322)) )
))
(declare-fun lt!186379 () tuple2!10074)

(declare-fun readBit!0 (BitStream!4322) tuple2!10074)

(assert (=> d!38588 (= lt!186379 (readBit!0 (BitStream!4323 (buf!2852 (_2!5297 lt!186308)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305))))))

(assert (=> d!38588 (= (readBitPure!0 (BitStream!4323 (buf!2852 (_2!5297 lt!186308)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305))) (tuple2!10067 (_2!5302 lt!186379) (_1!5302 lt!186379)))))

(declare-fun bs!9334 () Bool)

(assert (= bs!9334 d!38588))

(declare-fun m!181173 () Bool)

(assert (=> bs!9334 m!181173))

(assert (=> b!120010 d!38588))

(declare-fun d!38590 () Bool)

(declare-fun e!78650 () Bool)

(assert (=> d!38590 e!78650))

(declare-fun res!99398 () Bool)

(assert (=> d!38590 (=> (not res!99398) (not e!78650))))

(declare-fun lt!186408 () (_ BitVec 64))

(declare-fun lt!186405 () (_ BitVec 64))

(declare-fun lt!186409 () (_ BitVec 64))

(assert (=> d!38590 (= res!99398 (= lt!186405 (bvsub lt!186409 lt!186408)))))

(assert (=> d!38590 (or (= (bvand lt!186409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186408 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186409 lt!186408) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38590 (= lt!186408 (remainingBits!0 ((_ sign_extend 32) (size!2424 (buf!2852 (_1!5298 lt!186287)))) ((_ sign_extend 32) (currentByte!5525 (_1!5298 lt!186287))) ((_ sign_extend 32) (currentBit!5520 (_1!5298 lt!186287)))))))

(declare-fun lt!186406 () (_ BitVec 64))

(declare-fun lt!186404 () (_ BitVec 64))

(assert (=> d!38590 (= lt!186409 (bvmul lt!186406 lt!186404))))

(assert (=> d!38590 (or (= lt!186406 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186404 (bvsdiv (bvmul lt!186406 lt!186404) lt!186406)))))

(assert (=> d!38590 (= lt!186404 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38590 (= lt!186406 ((_ sign_extend 32) (size!2424 (buf!2852 (_1!5298 lt!186287)))))))

(assert (=> d!38590 (= lt!186405 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5525 (_1!5298 lt!186287))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5520 (_1!5298 lt!186287)))))))

(assert (=> d!38590 (invariant!0 (currentBit!5520 (_1!5298 lt!186287)) (currentByte!5525 (_1!5298 lt!186287)) (size!2424 (buf!2852 (_1!5298 lt!186287))))))

(assert (=> d!38590 (= (bitIndex!0 (size!2424 (buf!2852 (_1!5298 lt!186287))) (currentByte!5525 (_1!5298 lt!186287)) (currentBit!5520 (_1!5298 lt!186287))) lt!186405)))

(declare-fun b!120057 () Bool)

(declare-fun res!99397 () Bool)

(assert (=> b!120057 (=> (not res!99397) (not e!78650))))

(assert (=> b!120057 (= res!99397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186405))))

(declare-fun b!120058 () Bool)

(declare-fun lt!186407 () (_ BitVec 64))

(assert (=> b!120058 (= e!78650 (bvsle lt!186405 (bvmul lt!186407 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120058 (or (= lt!186407 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!186407 #b0000000000000000000000000000000000000000000000000000000000001000) lt!186407)))))

(assert (=> b!120058 (= lt!186407 ((_ sign_extend 32) (size!2424 (buf!2852 (_1!5298 lt!186287)))))))

(assert (= (and d!38590 res!99398) b!120057))

(assert (= (and b!120057 res!99397) b!120058))

(declare-fun m!181189 () Bool)

(assert (=> d!38590 m!181189))

(declare-fun m!181191 () Bool)

(assert (=> d!38590 m!181191))

(assert (=> b!120010 d!38590))

(declare-fun d!38594 () Bool)

(declare-fun res!99399 () Bool)

(declare-fun e!78651 () Bool)

(assert (=> d!38594 (=> (not res!99399) (not e!78651))))

(assert (=> d!38594 (= res!99399 (= (size!2424 (buf!2852 thiss!1305)) (size!2424 (buf!2852 (_2!5297 lt!186308)))))))

(assert (=> d!38594 (= (isPrefixOf!0 thiss!1305 (_2!5297 lt!186308)) e!78651)))

(declare-fun b!120059 () Bool)

(declare-fun res!99400 () Bool)

(assert (=> b!120059 (=> (not res!99400) (not e!78651))))

(assert (=> b!120059 (= res!99400 (bvsle (bitIndex!0 (size!2424 (buf!2852 thiss!1305)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305)) (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186308))) (currentByte!5525 (_2!5297 lt!186308)) (currentBit!5520 (_2!5297 lt!186308)))))))

(declare-fun b!120060 () Bool)

(declare-fun e!78652 () Bool)

(assert (=> b!120060 (= e!78651 e!78652)))

(declare-fun res!99401 () Bool)

(assert (=> b!120060 (=> res!99401 e!78652)))

(assert (=> b!120060 (= res!99401 (= (size!2424 (buf!2852 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!120061 () Bool)

(assert (=> b!120061 (= e!78652 (arrayBitRangesEq!0 (buf!2852 thiss!1305) (buf!2852 (_2!5297 lt!186308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2424 (buf!2852 thiss!1305)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305))))))

(assert (= (and d!38594 res!99399) b!120059))

(assert (= (and b!120059 res!99400) b!120060))

(assert (= (and b!120060 (not res!99401)) b!120061))

(assert (=> b!120059 m!181089))

(assert (=> b!120059 m!181093))

(assert (=> b!120061 m!181089))

(assert (=> b!120061 m!181089))

(declare-fun m!181193 () Bool)

(assert (=> b!120061 m!181193))

(assert (=> b!120010 d!38594))

(declare-fun d!38596 () Bool)

(assert (=> d!38596 (validate_offset_bits!1 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186308)))) ((_ sign_extend 32) (currentByte!5525 thiss!1305)) ((_ sign_extend 32) (currentBit!5520 thiss!1305)) lt!186296)))

(declare-fun lt!186412 () Unit!7391)

(declare-fun choose!9 (BitStream!4322 array!5352 (_ BitVec 64) BitStream!4322) Unit!7391)

(assert (=> d!38596 (= lt!186412 (choose!9 thiss!1305 (buf!2852 (_2!5297 lt!186308)) lt!186296 (BitStream!4323 (buf!2852 (_2!5297 lt!186308)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305))))))

(assert (=> d!38596 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2852 (_2!5297 lt!186308)) lt!186296) lt!186412)))

(declare-fun bs!9335 () Bool)

(assert (= bs!9335 d!38596))

(assert (=> bs!9335 m!181047))

(declare-fun m!181195 () Bool)

(assert (=> bs!9335 m!181195))

(assert (=> b!120010 d!38596))

(declare-datatypes ((tuple2!10076 0))(
  ( (tuple2!10077 (_1!5303 (_ BitVec 64)) (_2!5303 BitStream!4322)) )
))
(declare-fun lt!186415 () tuple2!10076)

(declare-fun d!38598 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10076)

(assert (=> d!38598 (= lt!186415 (readNLeastSignificantBitsLoop!0 (_1!5299 lt!186301) nBits!396 i!615 lt!186304))))

(assert (=> d!38598 (= (readNLeastSignificantBitsLoopPure!0 (_1!5299 lt!186301) nBits!396 i!615 lt!186304) (tuple2!10071 (_2!5303 lt!186415) (_1!5303 lt!186415)))))

(declare-fun bs!9336 () Bool)

(assert (= bs!9336 d!38598))

(declare-fun m!181197 () Bool)

(assert (=> bs!9336 m!181197))

(assert (=> b!120010 d!38598))

(declare-fun d!38600 () Bool)

(declare-fun lt!186416 () tuple2!10074)

(assert (=> d!38600 (= lt!186416 (readBit!0 lt!186303))))

(assert (=> d!38600 (= (readBitPure!0 lt!186303) (tuple2!10067 (_2!5302 lt!186416) (_1!5302 lt!186416)))))

(declare-fun bs!9337 () Bool)

(assert (= bs!9337 d!38600))

(declare-fun m!181199 () Bool)

(assert (=> bs!9337 m!181199))

(assert (=> b!120010 d!38600))

(declare-fun d!38602 () Bool)

(assert (=> d!38602 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186308)))) ((_ sign_extend 32) (currentByte!5525 (_2!5297 lt!186285))) ((_ sign_extend 32) (currentBit!5520 (_2!5297 lt!186285))) lt!186291) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186308)))) ((_ sign_extend 32) (currentByte!5525 (_2!5297 lt!186285))) ((_ sign_extend 32) (currentBit!5520 (_2!5297 lt!186285)))) lt!186291))))

(declare-fun bs!9338 () Bool)

(assert (= bs!9338 d!38602))

(declare-fun m!181201 () Bool)

(assert (=> bs!9338 m!181201))

(assert (=> b!120010 d!38602))

(declare-fun d!38604 () Bool)

(declare-fun lt!186417 () tuple2!10074)

(assert (=> d!38604 (= lt!186417 (readBit!0 (_1!5299 lt!186301)))))

(assert (=> d!38604 (= (readBitPure!0 (_1!5299 lt!186301)) (tuple2!10067 (_2!5302 lt!186417) (_1!5302 lt!186417)))))

(declare-fun bs!9339 () Bool)

(assert (= bs!9339 d!38604))

(declare-fun m!181203 () Bool)

(assert (=> bs!9339 m!181203))

(assert (=> b!120010 d!38604))

(declare-fun lt!186465 () tuple2!10068)

(declare-fun e!78657 () Bool)

(declare-fun b!120072 () Bool)

(declare-fun lt!186459 () (_ BitVec 64))

(declare-fun lt!186474 () (_ BitVec 64))

(assert (=> b!120072 (= e!78657 (= (_1!5299 lt!186465) (withMovedBitIndex!0 (_2!5299 lt!186465) (bvsub lt!186459 lt!186474))))))

(assert (=> b!120072 (or (= (bvand lt!186459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186474 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186459 lt!186474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120072 (= lt!186474 (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186308))) (currentByte!5525 (_2!5297 lt!186308)) (currentBit!5520 (_2!5297 lt!186308))))))

(assert (=> b!120072 (= lt!186459 (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))))))

(declare-fun b!120073 () Bool)

(declare-fun e!78658 () Unit!7391)

(declare-fun lt!186461 () Unit!7391)

(assert (=> b!120073 (= e!78658 lt!186461)))

(declare-fun lt!186476 () (_ BitVec 64))

(assert (=> b!120073 (= lt!186476 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186470 () (_ BitVec 64))

(assert (=> b!120073 (= lt!186470 (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5352 array!5352 (_ BitVec 64) (_ BitVec 64)) Unit!7391)

(assert (=> b!120073 (= lt!186461 (arrayBitRangesEqSymmetric!0 (buf!2852 (_2!5297 lt!186285)) (buf!2852 (_2!5297 lt!186308)) lt!186476 lt!186470))))

(assert (=> b!120073 (arrayBitRangesEq!0 (buf!2852 (_2!5297 lt!186308)) (buf!2852 (_2!5297 lt!186285)) lt!186476 lt!186470)))

(declare-fun b!120074 () Bool)

(declare-fun Unit!7399 () Unit!7391)

(assert (=> b!120074 (= e!78658 Unit!7399)))

(declare-fun d!38606 () Bool)

(assert (=> d!38606 e!78657))

(declare-fun res!99409 () Bool)

(assert (=> d!38606 (=> (not res!99409) (not e!78657))))

(assert (=> d!38606 (= res!99409 (isPrefixOf!0 (_1!5299 lt!186465) (_2!5299 lt!186465)))))

(declare-fun lt!186466 () BitStream!4322)

(assert (=> d!38606 (= lt!186465 (tuple2!10069 lt!186466 (_2!5297 lt!186308)))))

(declare-fun lt!186460 () Unit!7391)

(declare-fun lt!186468 () Unit!7391)

(assert (=> d!38606 (= lt!186460 lt!186468)))

(assert (=> d!38606 (isPrefixOf!0 lt!186466 (_2!5297 lt!186308))))

(assert (=> d!38606 (= lt!186468 (lemmaIsPrefixTransitive!0 lt!186466 (_2!5297 lt!186308) (_2!5297 lt!186308)))))

(declare-fun lt!186473 () Unit!7391)

(declare-fun lt!186463 () Unit!7391)

(assert (=> d!38606 (= lt!186473 lt!186463)))

(assert (=> d!38606 (isPrefixOf!0 lt!186466 (_2!5297 lt!186308))))

(assert (=> d!38606 (= lt!186463 (lemmaIsPrefixTransitive!0 lt!186466 (_2!5297 lt!186285) (_2!5297 lt!186308)))))

(declare-fun lt!186462 () Unit!7391)

(assert (=> d!38606 (= lt!186462 e!78658)))

(declare-fun c!7213 () Bool)

(assert (=> d!38606 (= c!7213 (not (= (size!2424 (buf!2852 (_2!5297 lt!186285))) #b00000000000000000000000000000000)))))

(declare-fun lt!186472 () Unit!7391)

(declare-fun lt!186469 () Unit!7391)

(assert (=> d!38606 (= lt!186472 lt!186469)))

(assert (=> d!38606 (isPrefixOf!0 (_2!5297 lt!186308) (_2!5297 lt!186308))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4322) Unit!7391)

(assert (=> d!38606 (= lt!186469 (lemmaIsPrefixRefl!0 (_2!5297 lt!186308)))))

(declare-fun lt!186464 () Unit!7391)

(declare-fun lt!186477 () Unit!7391)

(assert (=> d!38606 (= lt!186464 lt!186477)))

(assert (=> d!38606 (= lt!186477 (lemmaIsPrefixRefl!0 (_2!5297 lt!186308)))))

(declare-fun lt!186458 () Unit!7391)

(declare-fun lt!186471 () Unit!7391)

(assert (=> d!38606 (= lt!186458 lt!186471)))

(assert (=> d!38606 (isPrefixOf!0 lt!186466 lt!186466)))

(assert (=> d!38606 (= lt!186471 (lemmaIsPrefixRefl!0 lt!186466))))

(declare-fun lt!186467 () Unit!7391)

(declare-fun lt!186475 () Unit!7391)

(assert (=> d!38606 (= lt!186467 lt!186475)))

(assert (=> d!38606 (isPrefixOf!0 (_2!5297 lt!186285) (_2!5297 lt!186285))))

(assert (=> d!38606 (= lt!186475 (lemmaIsPrefixRefl!0 (_2!5297 lt!186285)))))

(assert (=> d!38606 (= lt!186466 (BitStream!4323 (buf!2852 (_2!5297 lt!186308)) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))))))

(assert (=> d!38606 (isPrefixOf!0 (_2!5297 lt!186285) (_2!5297 lt!186308))))

(assert (=> d!38606 (= (reader!0 (_2!5297 lt!186285) (_2!5297 lt!186308)) lt!186465)))

(declare-fun b!120075 () Bool)

(declare-fun res!99410 () Bool)

(assert (=> b!120075 (=> (not res!99410) (not e!78657))))

(assert (=> b!120075 (= res!99410 (isPrefixOf!0 (_1!5299 lt!186465) (_2!5297 lt!186285)))))

(declare-fun b!120076 () Bool)

(declare-fun res!99408 () Bool)

(assert (=> b!120076 (=> (not res!99408) (not e!78657))))

(assert (=> b!120076 (= res!99408 (isPrefixOf!0 (_2!5299 lt!186465) (_2!5297 lt!186308)))))

(assert (= (and d!38606 c!7213) b!120073))

(assert (= (and d!38606 (not c!7213)) b!120074))

(assert (= (and d!38606 res!99409) b!120075))

(assert (= (and b!120075 res!99410) b!120076))

(assert (= (and b!120076 res!99408) b!120072))

(declare-fun m!181205 () Bool)

(assert (=> b!120076 m!181205))

(assert (=> b!120073 m!181087))

(declare-fun m!181207 () Bool)

(assert (=> b!120073 m!181207))

(declare-fun m!181209 () Bool)

(assert (=> b!120073 m!181209))

(declare-fun m!181211 () Bool)

(assert (=> b!120072 m!181211))

(assert (=> b!120072 m!181093))

(assert (=> b!120072 m!181087))

(declare-fun m!181213 () Bool)

(assert (=> d!38606 m!181213))

(declare-fun m!181215 () Bool)

(assert (=> d!38606 m!181215))

(declare-fun m!181217 () Bool)

(assert (=> d!38606 m!181217))

(declare-fun m!181219 () Bool)

(assert (=> d!38606 m!181219))

(declare-fun m!181221 () Bool)

(assert (=> d!38606 m!181221))

(declare-fun m!181223 () Bool)

(assert (=> d!38606 m!181223))

(declare-fun m!181225 () Bool)

(assert (=> d!38606 m!181225))

(declare-fun m!181227 () Bool)

(assert (=> d!38606 m!181227))

(declare-fun m!181229 () Bool)

(assert (=> d!38606 m!181229))

(declare-fun m!181231 () Bool)

(assert (=> d!38606 m!181231))

(declare-fun m!181233 () Bool)

(assert (=> d!38606 m!181233))

(declare-fun m!181235 () Bool)

(assert (=> b!120075 m!181235))

(assert (=> b!120010 d!38606))

(declare-fun lt!186494 () (_ BitVec 64))

(declare-fun b!120077 () Bool)

(declare-fun lt!186479 () (_ BitVec 64))

(declare-fun lt!186485 () tuple2!10068)

(declare-fun e!78659 () Bool)

(assert (=> b!120077 (= e!78659 (= (_1!5299 lt!186485) (withMovedBitIndex!0 (_2!5299 lt!186485) (bvsub lt!186479 lt!186494))))))

(assert (=> b!120077 (or (= (bvand lt!186479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186494 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186479 lt!186494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120077 (= lt!186494 (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186308))) (currentByte!5525 (_2!5297 lt!186308)) (currentBit!5520 (_2!5297 lt!186308))))))

(assert (=> b!120077 (= lt!186479 (bitIndex!0 (size!2424 (buf!2852 thiss!1305)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305)))))

(declare-fun b!120078 () Bool)

(declare-fun e!78660 () Unit!7391)

(declare-fun lt!186481 () Unit!7391)

(assert (=> b!120078 (= e!78660 lt!186481)))

(declare-fun lt!186496 () (_ BitVec 64))

(assert (=> b!120078 (= lt!186496 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186490 () (_ BitVec 64))

(assert (=> b!120078 (= lt!186490 (bitIndex!0 (size!2424 (buf!2852 thiss!1305)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305)))))

(assert (=> b!120078 (= lt!186481 (arrayBitRangesEqSymmetric!0 (buf!2852 thiss!1305) (buf!2852 (_2!5297 lt!186308)) lt!186496 lt!186490))))

(assert (=> b!120078 (arrayBitRangesEq!0 (buf!2852 (_2!5297 lt!186308)) (buf!2852 thiss!1305) lt!186496 lt!186490)))

(declare-fun b!120079 () Bool)

(declare-fun Unit!7401 () Unit!7391)

(assert (=> b!120079 (= e!78660 Unit!7401)))

(declare-fun d!38608 () Bool)

(assert (=> d!38608 e!78659))

(declare-fun res!99412 () Bool)

(assert (=> d!38608 (=> (not res!99412) (not e!78659))))

(assert (=> d!38608 (= res!99412 (isPrefixOf!0 (_1!5299 lt!186485) (_2!5299 lt!186485)))))

(declare-fun lt!186486 () BitStream!4322)

(assert (=> d!38608 (= lt!186485 (tuple2!10069 lt!186486 (_2!5297 lt!186308)))))

(declare-fun lt!186480 () Unit!7391)

(declare-fun lt!186488 () Unit!7391)

(assert (=> d!38608 (= lt!186480 lt!186488)))

(assert (=> d!38608 (isPrefixOf!0 lt!186486 (_2!5297 lt!186308))))

(assert (=> d!38608 (= lt!186488 (lemmaIsPrefixTransitive!0 lt!186486 (_2!5297 lt!186308) (_2!5297 lt!186308)))))

(declare-fun lt!186493 () Unit!7391)

(declare-fun lt!186483 () Unit!7391)

(assert (=> d!38608 (= lt!186493 lt!186483)))

(assert (=> d!38608 (isPrefixOf!0 lt!186486 (_2!5297 lt!186308))))

(assert (=> d!38608 (= lt!186483 (lemmaIsPrefixTransitive!0 lt!186486 thiss!1305 (_2!5297 lt!186308)))))

(declare-fun lt!186482 () Unit!7391)

(assert (=> d!38608 (= lt!186482 e!78660)))

(declare-fun c!7214 () Bool)

(assert (=> d!38608 (= c!7214 (not (= (size!2424 (buf!2852 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!186492 () Unit!7391)

(declare-fun lt!186489 () Unit!7391)

(assert (=> d!38608 (= lt!186492 lt!186489)))

(assert (=> d!38608 (isPrefixOf!0 (_2!5297 lt!186308) (_2!5297 lt!186308))))

(assert (=> d!38608 (= lt!186489 (lemmaIsPrefixRefl!0 (_2!5297 lt!186308)))))

(declare-fun lt!186484 () Unit!7391)

(declare-fun lt!186497 () Unit!7391)

(assert (=> d!38608 (= lt!186484 lt!186497)))

(assert (=> d!38608 (= lt!186497 (lemmaIsPrefixRefl!0 (_2!5297 lt!186308)))))

(declare-fun lt!186478 () Unit!7391)

(declare-fun lt!186491 () Unit!7391)

(assert (=> d!38608 (= lt!186478 lt!186491)))

(assert (=> d!38608 (isPrefixOf!0 lt!186486 lt!186486)))

(assert (=> d!38608 (= lt!186491 (lemmaIsPrefixRefl!0 lt!186486))))

(declare-fun lt!186487 () Unit!7391)

(declare-fun lt!186495 () Unit!7391)

(assert (=> d!38608 (= lt!186487 lt!186495)))

(assert (=> d!38608 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!38608 (= lt!186495 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!38608 (= lt!186486 (BitStream!4323 (buf!2852 (_2!5297 lt!186308)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305)))))

(assert (=> d!38608 (isPrefixOf!0 thiss!1305 (_2!5297 lt!186308))))

(assert (=> d!38608 (= (reader!0 thiss!1305 (_2!5297 lt!186308)) lt!186485)))

(declare-fun b!120080 () Bool)

(declare-fun res!99413 () Bool)

(assert (=> b!120080 (=> (not res!99413) (not e!78659))))

(assert (=> b!120080 (= res!99413 (isPrefixOf!0 (_1!5299 lt!186485) thiss!1305))))

(declare-fun b!120081 () Bool)

(declare-fun res!99411 () Bool)

(assert (=> b!120081 (=> (not res!99411) (not e!78659))))

(assert (=> b!120081 (= res!99411 (isPrefixOf!0 (_2!5299 lt!186485) (_2!5297 lt!186308)))))

(assert (= (and d!38608 c!7214) b!120078))

(assert (= (and d!38608 (not c!7214)) b!120079))

(assert (= (and d!38608 res!99412) b!120080))

(assert (= (and b!120080 res!99413) b!120081))

(assert (= (and b!120081 res!99411) b!120077))

(declare-fun m!181237 () Bool)

(assert (=> b!120081 m!181237))

(assert (=> b!120078 m!181089))

(declare-fun m!181239 () Bool)

(assert (=> b!120078 m!181239))

(declare-fun m!181241 () Bool)

(assert (=> b!120078 m!181241))

(declare-fun m!181243 () Bool)

(assert (=> b!120077 m!181243))

(assert (=> b!120077 m!181093))

(assert (=> b!120077 m!181089))

(declare-fun m!181245 () Bool)

(assert (=> d!38608 m!181245))

(declare-fun m!181247 () Bool)

(assert (=> d!38608 m!181247))

(declare-fun m!181249 () Bool)

(assert (=> d!38608 m!181249))

(declare-fun m!181251 () Bool)

(assert (=> d!38608 m!181251))

(declare-fun m!181253 () Bool)

(assert (=> d!38608 m!181253))

(assert (=> d!38608 m!181223))

(declare-fun m!181255 () Bool)

(assert (=> d!38608 m!181255))

(assert (=> d!38608 m!181227))

(declare-fun m!181257 () Bool)

(assert (=> d!38608 m!181257))

(declare-fun m!181259 () Bool)

(assert (=> d!38608 m!181259))

(assert (=> d!38608 m!181073))

(declare-fun m!181261 () Bool)

(assert (=> b!120080 m!181261))

(assert (=> b!120010 d!38608))

(declare-fun d!38610 () Bool)

(assert (=> d!38610 (validate_offset_bits!1 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186308)))) ((_ sign_extend 32) (currentByte!5525 (_2!5297 lt!186285))) ((_ sign_extend 32) (currentBit!5520 (_2!5297 lt!186285))) lt!186291)))

(declare-fun lt!186498 () Unit!7391)

(assert (=> d!38610 (= lt!186498 (choose!9 (_2!5297 lt!186285) (buf!2852 (_2!5297 lt!186308)) lt!186291 (BitStream!4323 (buf!2852 (_2!5297 lt!186308)) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285)))))))

(assert (=> d!38610 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5297 lt!186285) (buf!2852 (_2!5297 lt!186308)) lt!186291) lt!186498)))

(declare-fun bs!9340 () Bool)

(assert (= bs!9340 d!38610))

(assert (=> bs!9340 m!181079))

(declare-fun m!181263 () Bool)

(assert (=> bs!9340 m!181263))

(assert (=> b!120010 d!38610))

(declare-fun b!120094 () Bool)

(declare-fun e!78666 () Bool)

(declare-fun lt!186509 () tuple2!10066)

(declare-fun lt!186508 () tuple2!10064)

(assert (=> b!120094 (= e!78666 (= (bitIndex!0 (size!2424 (buf!2852 (_1!5298 lt!186509))) (currentByte!5525 (_1!5298 lt!186509)) (currentBit!5520 (_1!5298 lt!186509))) (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186508))) (currentByte!5525 (_2!5297 lt!186508)) (currentBit!5520 (_2!5297 lt!186508)))))))

(declare-fun b!120093 () Bool)

(declare-fun e!78665 () Bool)

(assert (=> b!120093 (= e!78665 e!78666)))

(declare-fun res!99424 () Bool)

(assert (=> b!120093 (=> (not res!99424) (not e!78666))))

(assert (=> b!120093 (= res!99424 (and (= (_2!5298 lt!186509) lt!186292) (= (_1!5298 lt!186509) (_2!5297 lt!186508))))))

(assert (=> b!120093 (= lt!186509 (readBitPure!0 (readerFrom!0 (_2!5297 lt!186508) (currentBit!5520 thiss!1305) (currentByte!5525 thiss!1305))))))

(declare-fun d!38612 () Bool)

(assert (=> d!38612 e!78665))

(declare-fun res!99422 () Bool)

(assert (=> d!38612 (=> (not res!99422) (not e!78665))))

(assert (=> d!38612 (= res!99422 (= (size!2424 (buf!2852 thiss!1305)) (size!2424 (buf!2852 (_2!5297 lt!186508)))))))

(declare-fun choose!16 (BitStream!4322 Bool) tuple2!10064)

(assert (=> d!38612 (= lt!186508 (choose!16 thiss!1305 lt!186292))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38612 (validate_offset_bit!0 ((_ sign_extend 32) (size!2424 (buf!2852 thiss!1305))) ((_ sign_extend 32) (currentByte!5525 thiss!1305)) ((_ sign_extend 32) (currentBit!5520 thiss!1305)))))

(assert (=> d!38612 (= (appendBit!0 thiss!1305 lt!186292) lt!186508)))

(declare-fun b!120092 () Bool)

(declare-fun res!99423 () Bool)

(assert (=> b!120092 (=> (not res!99423) (not e!78665))))

(assert (=> b!120092 (= res!99423 (isPrefixOf!0 thiss!1305 (_2!5297 lt!186508)))))

(declare-fun b!120091 () Bool)

(declare-fun res!99425 () Bool)

(assert (=> b!120091 (=> (not res!99425) (not e!78665))))

(declare-fun lt!186507 () (_ BitVec 64))

(declare-fun lt!186510 () (_ BitVec 64))

(assert (=> b!120091 (= res!99425 (= (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186508))) (currentByte!5525 (_2!5297 lt!186508)) (currentBit!5520 (_2!5297 lt!186508))) (bvadd lt!186507 lt!186510)))))

(assert (=> b!120091 (or (not (= (bvand lt!186507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186510 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!186507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!186507 lt!186510) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120091 (= lt!186510 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!120091 (= lt!186507 (bitIndex!0 (size!2424 (buf!2852 thiss!1305)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305)))))

(assert (= (and d!38612 res!99422) b!120091))

(assert (= (and b!120091 res!99425) b!120092))

(assert (= (and b!120092 res!99423) b!120093))

(assert (= (and b!120093 res!99424) b!120094))

(declare-fun m!181265 () Bool)

(assert (=> b!120092 m!181265))

(declare-fun m!181267 () Bool)

(assert (=> b!120094 m!181267))

(declare-fun m!181269 () Bool)

(assert (=> b!120094 m!181269))

(declare-fun m!181271 () Bool)

(assert (=> d!38612 m!181271))

(declare-fun m!181273 () Bool)

(assert (=> d!38612 m!181273))

(declare-fun m!181275 () Bool)

(assert (=> b!120093 m!181275))

(assert (=> b!120093 m!181275))

(declare-fun m!181277 () Bool)

(assert (=> b!120093 m!181277))

(assert (=> b!120091 m!181269))

(assert (=> b!120091 m!181089))

(assert (=> b!120010 d!38612))

(declare-fun b!120247 () Bool)

(declare-fun e!78753 () Bool)

(declare-fun lt!186990 () tuple2!10066)

(declare-fun lt!187013 () tuple2!10064)

(assert (=> b!120247 (= e!78753 (= (bitIndex!0 (size!2424 (buf!2852 (_1!5298 lt!186990))) (currentByte!5525 (_1!5298 lt!186990)) (currentBit!5520 (_1!5298 lt!186990))) (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!187013))) (currentByte!5525 (_2!5297 lt!187013)) (currentBit!5520 (_2!5297 lt!187013)))))))

(declare-fun b!120248 () Bool)

(declare-fun e!78755 () tuple2!10064)

(declare-fun lt!187022 () Unit!7391)

(assert (=> b!120248 (= e!78755 (tuple2!10065 lt!187022 (_2!5297 lt!186285)))))

(declare-fun lt!186982 () BitStream!4322)

(assert (=> b!120248 (= lt!186982 (_2!5297 lt!186285))))

(assert (=> b!120248 (= lt!187022 (lemmaIsPrefixRefl!0 lt!186982))))

(declare-fun call!1568 () Bool)

(assert (=> b!120248 call!1568))

(declare-fun b!120249 () Bool)

(declare-fun res!99551 () Bool)

(assert (=> b!120249 (= res!99551 (= (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!187013))) (currentByte!5525 (_2!5297 lt!187013)) (currentBit!5520 (_2!5297 lt!187013))) (bvadd (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!78751 () Bool)

(assert (=> b!120249 (=> (not res!99551) (not e!78751))))

(declare-fun b!120250 () Bool)

(declare-fun res!99550 () Bool)

(declare-fun e!78754 () Bool)

(assert (=> b!120250 (=> (not res!99550) (not e!78754))))

(declare-fun lt!187005 () tuple2!10064)

(declare-fun lt!187020 () (_ BitVec 64))

(declare-fun lt!186988 () (_ BitVec 64))

(assert (=> b!120250 (= res!99550 (= (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!187005))) (currentByte!5525 (_2!5297 lt!187005)) (currentBit!5520 (_2!5297 lt!187005))) (bvadd lt!187020 lt!186988)))))

(assert (=> b!120250 (or (not (= (bvand lt!187020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186988 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!187020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!187020 lt!186988) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120250 (= lt!186988 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!120250 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120250 (= lt!187020 (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))))))

(declare-fun lt!186989 () tuple2!10068)

(declare-fun lt!187023 () tuple2!10070)

(declare-fun b!120251 () Bool)

(assert (=> b!120251 (= e!78754 (and (= (_2!5300 lt!187023) v!199) (= (_1!5300 lt!187023) (_2!5299 lt!186989))))))

(declare-fun lt!186996 () (_ BitVec 64))

(assert (=> b!120251 (= lt!187023 (readNLeastSignificantBitsLoopPure!0 (_1!5299 lt!186989) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186996))))

(declare-fun lt!187021 () Unit!7391)

(declare-fun lt!187011 () Unit!7391)

(assert (=> b!120251 (= lt!187021 lt!187011)))

(declare-fun lt!186997 () (_ BitVec 64))

(assert (=> b!120251 (validate_offset_bits!1 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!187005)))) ((_ sign_extend 32) (currentByte!5525 (_2!5297 lt!186285))) ((_ sign_extend 32) (currentBit!5520 (_2!5297 lt!186285))) lt!186997)))

(assert (=> b!120251 (= lt!187011 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5297 lt!186285) (buf!2852 (_2!5297 lt!187005)) lt!186997))))

(declare-fun e!78752 () Bool)

(assert (=> b!120251 e!78752))

(declare-fun res!99548 () Bool)

(assert (=> b!120251 (=> (not res!99548) (not e!78752))))

(assert (=> b!120251 (= res!99548 (and (= (size!2424 (buf!2852 (_2!5297 lt!186285))) (size!2424 (buf!2852 (_2!5297 lt!187005)))) (bvsge lt!186997 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120251 (= lt!186997 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!120251 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120251 (= lt!186996 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!120251 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120251 (= lt!186989 (reader!0 (_2!5297 lt!186285) (_2!5297 lt!187005)))))

(declare-fun b!120252 () Bool)

(assert (=> b!120252 (= lt!186990 (readBitPure!0 (readerFrom!0 (_2!5297 lt!187013) (currentBit!5520 (_2!5297 lt!186285)) (currentByte!5525 (_2!5297 lt!186285)))))))

(declare-fun res!99547 () Bool)

(declare-fun lt!187018 () Bool)

(assert (=> b!120252 (= res!99547 (and (= (_2!5298 lt!186990) lt!187018) (= (_1!5298 lt!186990) (_2!5297 lt!187013))))))

(assert (=> b!120252 (=> (not res!99547) (not e!78753))))

(assert (=> b!120252 (= e!78751 e!78753)))

(declare-fun d!38614 () Bool)

(assert (=> d!38614 e!78754))

(declare-fun res!99546 () Bool)

(assert (=> d!38614 (=> (not res!99546) (not e!78754))))

(assert (=> d!38614 (= res!99546 (= (size!2424 (buf!2852 (_2!5297 lt!186285))) (size!2424 (buf!2852 (_2!5297 lt!187005)))))))

(assert (=> d!38614 (= lt!187005 e!78755)))

(declare-fun c!7232 () Bool)

(assert (=> d!38614 (= c!7232 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!38614 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!38614 (= (appendNLeastSignificantBitsLoop!0 (_2!5297 lt!186285) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!187005)))

(declare-fun b!120253 () Bool)

(declare-fun res!99549 () Bool)

(assert (=> b!120253 (= res!99549 call!1568)))

(assert (=> b!120253 (=> (not res!99549) (not e!78751))))

(declare-fun b!120254 () Bool)

(declare-fun e!78750 () (_ BitVec 64))

(assert (=> b!120254 (= e!78750 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!120255 () Bool)

(declare-fun e!78749 () Bool)

(declare-fun lt!187007 () tuple2!10066)

(declare-fun lt!186985 () tuple2!10066)

(assert (=> b!120255 (= e!78749 (= (_2!5298 lt!187007) (_2!5298 lt!186985)))))

(declare-fun b!120256 () Bool)

(declare-fun res!99545 () Bool)

(assert (=> b!120256 (=> (not res!99545) (not e!78754))))

(assert (=> b!120256 (= res!99545 (isPrefixOf!0 (_2!5297 lt!186285) (_2!5297 lt!187005)))))

(declare-fun b!120257 () Bool)

(declare-fun lt!187001 () tuple2!10064)

(declare-fun Unit!7403 () Unit!7391)

(assert (=> b!120257 (= e!78755 (tuple2!10065 Unit!7403 (_2!5297 lt!187001)))))

(assert (=> b!120257 (= lt!187018 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120257 (= lt!187013 (appendBit!0 (_2!5297 lt!186285) lt!187018))))

(declare-fun res!99552 () Bool)

(assert (=> b!120257 (= res!99552 (= (size!2424 (buf!2852 (_2!5297 lt!186285))) (size!2424 (buf!2852 (_2!5297 lt!187013)))))))

(assert (=> b!120257 (=> (not res!99552) (not e!78751))))

(assert (=> b!120257 e!78751))

(declare-fun lt!186999 () tuple2!10064)

(assert (=> b!120257 (= lt!186999 lt!187013)))

(assert (=> b!120257 (= lt!187001 (appendNLeastSignificantBitsLoop!0 (_2!5297 lt!186999) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!187004 () Unit!7391)

(assert (=> b!120257 (= lt!187004 (lemmaIsPrefixTransitive!0 (_2!5297 lt!186285) (_2!5297 lt!186999) (_2!5297 lt!187001)))))

(assert (=> b!120257 (isPrefixOf!0 (_2!5297 lt!186285) (_2!5297 lt!187001))))

(declare-fun lt!187000 () Unit!7391)

(assert (=> b!120257 (= lt!187000 lt!187004)))

(assert (=> b!120257 (invariant!0 (currentBit!5520 (_2!5297 lt!186285)) (currentByte!5525 (_2!5297 lt!186285)) (size!2424 (buf!2852 (_2!5297 lt!186999))))))

(declare-fun lt!186991 () BitStream!4322)

(assert (=> b!120257 (= lt!186991 (BitStream!4323 (buf!2852 (_2!5297 lt!186999)) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))))))

(assert (=> b!120257 (invariant!0 (currentBit!5520 lt!186991) (currentByte!5525 lt!186991) (size!2424 (buf!2852 (_2!5297 lt!187001))))))

(declare-fun lt!187019 () BitStream!4322)

(assert (=> b!120257 (= lt!187019 (BitStream!4323 (buf!2852 (_2!5297 lt!187001)) (currentByte!5525 lt!186991) (currentBit!5520 lt!186991)))))

(assert (=> b!120257 (= lt!187007 (readBitPure!0 lt!186991))))

(assert (=> b!120257 (= lt!186985 (readBitPure!0 lt!187019))))

(declare-fun lt!187017 () Unit!7391)

(assert (=> b!120257 (= lt!187017 (readBitPrefixLemma!0 lt!186991 (_2!5297 lt!187001)))))

(declare-fun res!99544 () Bool)

(assert (=> b!120257 (= res!99544 (= (bitIndex!0 (size!2424 (buf!2852 (_1!5298 lt!187007))) (currentByte!5525 (_1!5298 lt!187007)) (currentBit!5520 (_1!5298 lt!187007))) (bitIndex!0 (size!2424 (buf!2852 (_1!5298 lt!186985))) (currentByte!5525 (_1!5298 lt!186985)) (currentBit!5520 (_1!5298 lt!186985)))))))

(assert (=> b!120257 (=> (not res!99544) (not e!78749))))

(assert (=> b!120257 e!78749))

(declare-fun lt!186981 () Unit!7391)

(assert (=> b!120257 (= lt!186981 lt!187017)))

(declare-fun lt!186992 () tuple2!10068)

(assert (=> b!120257 (= lt!186992 (reader!0 (_2!5297 lt!186285) (_2!5297 lt!187001)))))

(declare-fun lt!186987 () tuple2!10068)

(assert (=> b!120257 (= lt!186987 (reader!0 (_2!5297 lt!186999) (_2!5297 lt!187001)))))

(declare-fun lt!187002 () tuple2!10066)

(assert (=> b!120257 (= lt!187002 (readBitPure!0 (_1!5299 lt!186992)))))

(assert (=> b!120257 (= (_2!5298 lt!187002) lt!187018)))

(declare-fun lt!187008 () Unit!7391)

(declare-fun Unit!7404 () Unit!7391)

(assert (=> b!120257 (= lt!187008 Unit!7404)))

(declare-fun lt!187009 () (_ BitVec 64))

(assert (=> b!120257 (= lt!187009 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!186995 () (_ BitVec 64))

(assert (=> b!120257 (= lt!186995 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!187010 () Unit!7391)

(assert (=> b!120257 (= lt!187010 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5297 lt!186285) (buf!2852 (_2!5297 lt!187001)) lt!186995))))

(assert (=> b!120257 (validate_offset_bits!1 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!187001)))) ((_ sign_extend 32) (currentByte!5525 (_2!5297 lt!186285))) ((_ sign_extend 32) (currentBit!5520 (_2!5297 lt!186285))) lt!186995)))

(declare-fun lt!186986 () Unit!7391)

(assert (=> b!120257 (= lt!186986 lt!187010)))

(declare-fun lt!186984 () tuple2!10070)

(assert (=> b!120257 (= lt!186984 (readNLeastSignificantBitsLoopPure!0 (_1!5299 lt!186992) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187009))))

(declare-fun lt!187016 () (_ BitVec 64))

(assert (=> b!120257 (= lt!187016 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!186979 () Unit!7391)

(assert (=> b!120257 (= lt!186979 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5297 lt!186999) (buf!2852 (_2!5297 lt!187001)) lt!187016))))

(assert (=> b!120257 (validate_offset_bits!1 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!187001)))) ((_ sign_extend 32) (currentByte!5525 (_2!5297 lt!186999))) ((_ sign_extend 32) (currentBit!5520 (_2!5297 lt!186999))) lt!187016)))

(declare-fun lt!187006 () Unit!7391)

(assert (=> b!120257 (= lt!187006 lt!186979)))

(declare-fun lt!186980 () tuple2!10070)

(assert (=> b!120257 (= lt!186980 (readNLeastSignificantBitsLoopPure!0 (_1!5299 lt!186987) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!187009 (ite (_2!5298 lt!187002) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!186983 () tuple2!10070)

(assert (=> b!120257 (= lt!186983 (readNLeastSignificantBitsLoopPure!0 (_1!5299 lt!186992) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187009))))

(declare-fun c!7233 () Bool)

(assert (=> b!120257 (= c!7233 (_2!5298 (readBitPure!0 (_1!5299 lt!186992))))))

(declare-fun lt!187012 () tuple2!10070)

(assert (=> b!120257 (= lt!187012 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5299 lt!186992) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!187009 e!78750)))))

(declare-fun lt!186998 () Unit!7391)

(assert (=> b!120257 (= lt!186998 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5299 lt!186992) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187009))))

(assert (=> b!120257 (and (= (_2!5300 lt!186983) (_2!5300 lt!187012)) (= (_1!5300 lt!186983) (_1!5300 lt!187012)))))

(declare-fun lt!186993 () Unit!7391)

(assert (=> b!120257 (= lt!186993 lt!186998)))

(assert (=> b!120257 (= (_1!5299 lt!186992) (withMovedBitIndex!0 (_2!5299 lt!186992) (bvsub (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))) (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!187001))) (currentByte!5525 (_2!5297 lt!187001)) (currentBit!5520 (_2!5297 lt!187001))))))))

(declare-fun lt!186994 () Unit!7391)

(declare-fun Unit!7405 () Unit!7391)

(assert (=> b!120257 (= lt!186994 Unit!7405)))

(assert (=> b!120257 (= (_1!5299 lt!186987) (withMovedBitIndex!0 (_2!5299 lt!186987) (bvsub (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186999))) (currentByte!5525 (_2!5297 lt!186999)) (currentBit!5520 (_2!5297 lt!186999))) (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!187001))) (currentByte!5525 (_2!5297 lt!187001)) (currentBit!5520 (_2!5297 lt!187001))))))))

(declare-fun lt!187015 () Unit!7391)

(declare-fun Unit!7406 () Unit!7391)

(assert (=> b!120257 (= lt!187015 Unit!7406)))

(assert (=> b!120257 (= (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))) (bvsub (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186999))) (currentByte!5525 (_2!5297 lt!186999)) (currentBit!5520 (_2!5297 lt!186999))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!187003 () Unit!7391)

(declare-fun Unit!7407 () Unit!7391)

(assert (=> b!120257 (= lt!187003 Unit!7407)))

(assert (=> b!120257 (= (_2!5300 lt!186984) (_2!5300 lt!186980))))

(declare-fun lt!187014 () Unit!7391)

(declare-fun Unit!7408 () Unit!7391)

(assert (=> b!120257 (= lt!187014 Unit!7408)))

(assert (=> b!120257 (= (_1!5300 lt!186984) (_2!5299 lt!186992))))

(declare-fun b!120258 () Bool)

(assert (=> b!120258 (= e!78750 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!120259 () Bool)

(assert (=> b!120259 (= e!78752 (validate_offset_bits!1 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186285)))) ((_ sign_extend 32) (currentByte!5525 (_2!5297 lt!186285))) ((_ sign_extend 32) (currentBit!5520 (_2!5297 lt!186285))) lt!186997))))

(declare-fun bm!1565 () Bool)

(assert (=> bm!1565 (= call!1568 (isPrefixOf!0 (ite c!7232 (_2!5297 lt!186285) lt!186982) (ite c!7232 (_2!5297 lt!187013) lt!186982)))))

(assert (= (and d!38614 c!7232) b!120257))

(assert (= (and d!38614 (not c!7232)) b!120248))

(assert (= (and b!120257 res!99552) b!120249))

(assert (= (and b!120249 res!99551) b!120253))

(assert (= (and b!120253 res!99549) b!120252))

(assert (= (and b!120252 res!99547) b!120247))

(assert (= (and b!120257 res!99544) b!120255))

(assert (= (and b!120257 c!7233) b!120254))

(assert (= (and b!120257 (not c!7233)) b!120258))

(assert (= (or b!120253 b!120248) bm!1565))

(assert (= (and d!38614 res!99546) b!120250))

(assert (= (and b!120250 res!99550) b!120256))

(assert (= (and b!120256 res!99545) b!120251))

(assert (= (and b!120251 res!99548) b!120259))

(declare-fun m!181545 () Bool)

(assert (=> b!120248 m!181545))

(declare-fun m!181547 () Bool)

(assert (=> b!120259 m!181547))

(declare-fun m!181549 () Bool)

(assert (=> b!120249 m!181549))

(assert (=> b!120249 m!181087))

(declare-fun m!181551 () Bool)

(assert (=> b!120252 m!181551))

(assert (=> b!120252 m!181551))

(declare-fun m!181553 () Bool)

(assert (=> b!120252 m!181553))

(declare-fun m!181555 () Bool)

(assert (=> b!120251 m!181555))

(declare-fun m!181557 () Bool)

(assert (=> b!120251 m!181557))

(declare-fun m!181559 () Bool)

(assert (=> b!120251 m!181559))

(declare-fun m!181561 () Bool)

(assert (=> b!120251 m!181561))

(declare-fun m!181563 () Bool)

(assert (=> b!120251 m!181563))

(declare-fun m!181565 () Bool)

(assert (=> bm!1565 m!181565))

(declare-fun m!181567 () Bool)

(assert (=> b!120250 m!181567))

(assert (=> b!120250 m!181087))

(declare-fun m!181569 () Bool)

(assert (=> b!120257 m!181569))

(declare-fun m!181571 () Bool)

(assert (=> b!120257 m!181571))

(declare-fun m!181573 () Bool)

(assert (=> b!120257 m!181573))

(declare-fun m!181575 () Bool)

(assert (=> b!120257 m!181575))

(declare-fun m!181577 () Bool)

(assert (=> b!120257 m!181577))

(declare-fun m!181579 () Bool)

(assert (=> b!120257 m!181579))

(declare-fun m!181581 () Bool)

(assert (=> b!120257 m!181581))

(declare-fun m!181583 () Bool)

(assert (=> b!120257 m!181583))

(declare-fun m!181585 () Bool)

(assert (=> b!120257 m!181585))

(declare-fun m!181587 () Bool)

(assert (=> b!120257 m!181587))

(declare-fun m!181589 () Bool)

(assert (=> b!120257 m!181589))

(declare-fun m!181591 () Bool)

(assert (=> b!120257 m!181591))

(declare-fun m!181593 () Bool)

(assert (=> b!120257 m!181593))

(declare-fun m!181595 () Bool)

(assert (=> b!120257 m!181595))

(assert (=> b!120257 m!181087))

(declare-fun m!181597 () Bool)

(assert (=> b!120257 m!181597))

(declare-fun m!181599 () Bool)

(assert (=> b!120257 m!181599))

(assert (=> b!120257 m!181585))

(declare-fun m!181601 () Bool)

(assert (=> b!120257 m!181601))

(declare-fun m!181603 () Bool)

(assert (=> b!120257 m!181603))

(declare-fun m!181605 () Bool)

(assert (=> b!120257 m!181605))

(declare-fun m!181607 () Bool)

(assert (=> b!120257 m!181607))

(declare-fun m!181609 () Bool)

(assert (=> b!120257 m!181609))

(declare-fun m!181611 () Bool)

(assert (=> b!120257 m!181611))

(declare-fun m!181613 () Bool)

(assert (=> b!120257 m!181613))

(declare-fun m!181615 () Bool)

(assert (=> b!120257 m!181615))

(assert (=> b!120257 m!181563))

(declare-fun m!181617 () Bool)

(assert (=> b!120257 m!181617))

(declare-fun m!181619 () Bool)

(assert (=> b!120257 m!181619))

(declare-fun m!181621 () Bool)

(assert (=> b!120257 m!181621))

(declare-fun m!181623 () Bool)

(assert (=> b!120247 m!181623))

(assert (=> b!120247 m!181549))

(declare-fun m!181625 () Bool)

(assert (=> b!120256 m!181625))

(assert (=> b!120010 d!38614))

(declare-fun d!38698 () Bool)

(assert (=> d!38698 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186308)))) ((_ sign_extend 32) (currentByte!5525 thiss!1305)) ((_ sign_extend 32) (currentBit!5520 thiss!1305)) lt!186296) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186308)))) ((_ sign_extend 32) (currentByte!5525 thiss!1305)) ((_ sign_extend 32) (currentBit!5520 thiss!1305))) lt!186296))))

(declare-fun bs!9363 () Bool)

(assert (= bs!9363 d!38698))

(declare-fun m!181627 () Bool)

(assert (=> bs!9363 m!181627))

(assert (=> b!120010 d!38698))

(declare-fun d!38700 () Bool)

(declare-fun e!78758 () Bool)

(assert (=> d!38700 e!78758))

(declare-fun res!99557 () Bool)

(assert (=> d!38700 (=> (not res!99557) (not e!78758))))

(declare-fun lt!187029 () (_ BitVec 64))

(declare-fun lt!187028 () (_ BitVec 64))

(declare-fun lt!187025 () (_ BitVec 64))

(assert (=> d!38700 (= res!99557 (= lt!187025 (bvsub lt!187029 lt!187028)))))

(assert (=> d!38700 (or (= (bvand lt!187029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187028 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187029 lt!187028) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38700 (= lt!187028 (remainingBits!0 ((_ sign_extend 32) (size!2424 (buf!2852 (_1!5298 lt!186305)))) ((_ sign_extend 32) (currentByte!5525 (_1!5298 lt!186305))) ((_ sign_extend 32) (currentBit!5520 (_1!5298 lt!186305)))))))

(declare-fun lt!187026 () (_ BitVec 64))

(declare-fun lt!187024 () (_ BitVec 64))

(assert (=> d!38700 (= lt!187029 (bvmul lt!187026 lt!187024))))

(assert (=> d!38700 (or (= lt!187026 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187024 (bvsdiv (bvmul lt!187026 lt!187024) lt!187026)))))

(assert (=> d!38700 (= lt!187024 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38700 (= lt!187026 ((_ sign_extend 32) (size!2424 (buf!2852 (_1!5298 lt!186305)))))))

(assert (=> d!38700 (= lt!187025 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5525 (_1!5298 lt!186305))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5520 (_1!5298 lt!186305)))))))

(assert (=> d!38700 (invariant!0 (currentBit!5520 (_1!5298 lt!186305)) (currentByte!5525 (_1!5298 lt!186305)) (size!2424 (buf!2852 (_1!5298 lt!186305))))))

(assert (=> d!38700 (= (bitIndex!0 (size!2424 (buf!2852 (_1!5298 lt!186305))) (currentByte!5525 (_1!5298 lt!186305)) (currentBit!5520 (_1!5298 lt!186305))) lt!187025)))

(declare-fun b!120263 () Bool)

(declare-fun res!99556 () Bool)

(assert (=> b!120263 (=> (not res!99556) (not e!78758))))

(assert (=> b!120263 (= res!99556 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187025))))

(declare-fun b!120264 () Bool)

(declare-fun lt!187027 () (_ BitVec 64))

(assert (=> b!120264 (= e!78758 (bvsle lt!187025 (bvmul lt!187027 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120264 (or (= lt!187027 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187027 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187027)))))

(assert (=> b!120264 (= lt!187027 ((_ sign_extend 32) (size!2424 (buf!2852 (_1!5298 lt!186305)))))))

(assert (= (and d!38700 res!99557) b!120263))

(assert (= (and b!120263 res!99556) b!120264))

(declare-fun m!181629 () Bool)

(assert (=> d!38700 m!181629))

(declare-fun m!181631 () Bool)

(assert (=> d!38700 m!181631))

(assert (=> b!120010 d!38700))

(declare-fun d!38702 () Bool)

(declare-fun e!78761 () Bool)

(assert (=> d!38702 e!78761))

(declare-fun res!99560 () Bool)

(assert (=> d!38702 (=> (not res!99560) (not e!78761))))

(declare-fun lt!187038 () tuple2!10066)

(declare-fun lt!187040 () tuple2!10066)

(assert (=> d!38702 (= res!99560 (= (bitIndex!0 (size!2424 (buf!2852 (_1!5298 lt!187038))) (currentByte!5525 (_1!5298 lt!187038)) (currentBit!5520 (_1!5298 lt!187038))) (bitIndex!0 (size!2424 (buf!2852 (_1!5298 lt!187040))) (currentByte!5525 (_1!5298 lt!187040)) (currentBit!5520 (_1!5298 lt!187040)))))))

(declare-fun lt!187039 () Unit!7391)

(declare-fun lt!187041 () BitStream!4322)

(declare-fun choose!50 (BitStream!4322 BitStream!4322 BitStream!4322 tuple2!10066 tuple2!10066 BitStream!4322 Bool tuple2!10066 tuple2!10066 BitStream!4322 Bool) Unit!7391)

(assert (=> d!38702 (= lt!187039 (choose!50 lt!186303 (_2!5297 lt!186308) lt!187041 lt!187038 (tuple2!10067 (_1!5298 lt!187038) (_2!5298 lt!187038)) (_1!5298 lt!187038) (_2!5298 lt!187038) lt!187040 (tuple2!10067 (_1!5298 lt!187040) (_2!5298 lt!187040)) (_1!5298 lt!187040) (_2!5298 lt!187040)))))

(assert (=> d!38702 (= lt!187040 (readBitPure!0 lt!187041))))

(assert (=> d!38702 (= lt!187038 (readBitPure!0 lt!186303))))

(assert (=> d!38702 (= lt!187041 (BitStream!4323 (buf!2852 (_2!5297 lt!186308)) (currentByte!5525 lt!186303) (currentBit!5520 lt!186303)))))

(assert (=> d!38702 (invariant!0 (currentBit!5520 lt!186303) (currentByte!5525 lt!186303) (size!2424 (buf!2852 (_2!5297 lt!186308))))))

(assert (=> d!38702 (= (readBitPrefixLemma!0 lt!186303 (_2!5297 lt!186308)) lt!187039)))

(declare-fun b!120267 () Bool)

(assert (=> b!120267 (= e!78761 (= (_2!5298 lt!187038) (_2!5298 lt!187040)))))

(assert (= (and d!38702 res!99560) b!120267))

(declare-fun m!181633 () Bool)

(assert (=> d!38702 m!181633))

(assert (=> d!38702 m!181053))

(declare-fun m!181635 () Bool)

(assert (=> d!38702 m!181635))

(declare-fun m!181637 () Bool)

(assert (=> d!38702 m!181637))

(declare-fun m!181639 () Bool)

(assert (=> d!38702 m!181639))

(declare-fun m!181641 () Bool)

(assert (=> d!38702 m!181641))

(assert (=> b!120010 d!38702))

(declare-fun d!38704 () Bool)

(declare-fun lt!187042 () tuple2!10076)

(assert (=> d!38704 (= lt!187042 (readNLeastSignificantBitsLoop!0 (_1!5299 lt!186307) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186299))))

(assert (=> d!38704 (= (readNLeastSignificantBitsLoopPure!0 (_1!5299 lt!186307) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186299) (tuple2!10071 (_2!5303 lt!187042) (_1!5303 lt!187042)))))

(declare-fun bs!9364 () Bool)

(assert (= bs!9364 d!38704))

(declare-fun m!181643 () Bool)

(assert (=> bs!9364 m!181643))

(assert (=> b!120010 d!38704))

(declare-fun d!38706 () Bool)

(assert (=> d!38706 (isPrefixOf!0 thiss!1305 (_2!5297 lt!186308))))

(declare-fun lt!187045 () Unit!7391)

(declare-fun choose!30 (BitStream!4322 BitStream!4322 BitStream!4322) Unit!7391)

(assert (=> d!38706 (= lt!187045 (choose!30 thiss!1305 (_2!5297 lt!186285) (_2!5297 lt!186308)))))

(assert (=> d!38706 (isPrefixOf!0 thiss!1305 (_2!5297 lt!186285))))

(assert (=> d!38706 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5297 lt!186285) (_2!5297 lt!186308)) lt!187045)))

(declare-fun bs!9365 () Bool)

(assert (= bs!9365 d!38706))

(assert (=> bs!9365 m!181073))

(declare-fun m!181645 () Bool)

(assert (=> bs!9365 m!181645))

(assert (=> bs!9365 m!181107))

(assert (=> b!120010 d!38706))

(declare-fun d!38708 () Bool)

(declare-fun lt!187046 () tuple2!10074)

(assert (=> d!38708 (= lt!187046 (readBit!0 (readerFrom!0 (_2!5297 lt!186285) (currentBit!5520 thiss!1305) (currentByte!5525 thiss!1305))))))

(assert (=> d!38708 (= (readBitPure!0 (readerFrom!0 (_2!5297 lt!186285) (currentBit!5520 thiss!1305) (currentByte!5525 thiss!1305))) (tuple2!10067 (_2!5302 lt!187046) (_1!5302 lt!187046)))))

(declare-fun bs!9366 () Bool)

(assert (= bs!9366 d!38708))

(assert (=> bs!9366 m!181117))

(declare-fun m!181647 () Bool)

(assert (=> bs!9366 m!181647))

(assert (=> b!120009 d!38708))

(declare-fun d!38710 () Bool)

(declare-fun e!78764 () Bool)

(assert (=> d!38710 e!78764))

(declare-fun res!99564 () Bool)

(assert (=> d!38710 (=> (not res!99564) (not e!78764))))

(assert (=> d!38710 (= res!99564 (invariant!0 (currentBit!5520 (_2!5297 lt!186285)) (currentByte!5525 (_2!5297 lt!186285)) (size!2424 (buf!2852 (_2!5297 lt!186285)))))))

(assert (=> d!38710 (= (readerFrom!0 (_2!5297 lt!186285) (currentBit!5520 thiss!1305) (currentByte!5525 thiss!1305)) (BitStream!4323 (buf!2852 (_2!5297 lt!186285)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305)))))

(declare-fun b!120270 () Bool)

(assert (=> b!120270 (= e!78764 (invariant!0 (currentBit!5520 thiss!1305) (currentByte!5525 thiss!1305) (size!2424 (buf!2852 (_2!5297 lt!186285)))))))

(assert (= (and d!38710 res!99564) b!120270))

(declare-fun m!181649 () Bool)

(assert (=> d!38710 m!181649))

(assert (=> b!120270 m!181105))

(assert (=> b!120009 d!38710))

(declare-fun d!38712 () Bool)

(assert (=> d!38712 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5520 thiss!1305) (currentByte!5525 thiss!1305) (size!2424 (buf!2852 thiss!1305))))))

(declare-fun bs!9367 () Bool)

(assert (= bs!9367 d!38712))

(declare-fun m!181651 () Bool)

(assert (=> bs!9367 m!181651))

(assert (=> start!23682 d!38712))

(declare-fun d!38714 () Bool)

(declare-fun e!78765 () Bool)

(assert (=> d!38714 e!78765))

(declare-fun res!99566 () Bool)

(assert (=> d!38714 (=> (not res!99566) (not e!78765))))

(declare-fun lt!187052 () (_ BitVec 64))

(declare-fun lt!187051 () (_ BitVec 64))

(declare-fun lt!187048 () (_ BitVec 64))

(assert (=> d!38714 (= res!99566 (= lt!187048 (bvsub lt!187052 lt!187051)))))

(assert (=> d!38714 (or (= (bvand lt!187052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187051 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187052 lt!187051) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38714 (= lt!187051 (remainingBits!0 ((_ sign_extend 32) (size!2424 (buf!2852 (_1!5298 lt!186295)))) ((_ sign_extend 32) (currentByte!5525 (_1!5298 lt!186295))) ((_ sign_extend 32) (currentBit!5520 (_1!5298 lt!186295)))))))

(declare-fun lt!187049 () (_ BitVec 64))

(declare-fun lt!187047 () (_ BitVec 64))

(assert (=> d!38714 (= lt!187052 (bvmul lt!187049 lt!187047))))

(assert (=> d!38714 (or (= lt!187049 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187047 (bvsdiv (bvmul lt!187049 lt!187047) lt!187049)))))

(assert (=> d!38714 (= lt!187047 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38714 (= lt!187049 ((_ sign_extend 32) (size!2424 (buf!2852 (_1!5298 lt!186295)))))))

(assert (=> d!38714 (= lt!187048 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5525 (_1!5298 lt!186295))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5520 (_1!5298 lt!186295)))))))

(assert (=> d!38714 (invariant!0 (currentBit!5520 (_1!5298 lt!186295)) (currentByte!5525 (_1!5298 lt!186295)) (size!2424 (buf!2852 (_1!5298 lt!186295))))))

(assert (=> d!38714 (= (bitIndex!0 (size!2424 (buf!2852 (_1!5298 lt!186295))) (currentByte!5525 (_1!5298 lt!186295)) (currentBit!5520 (_1!5298 lt!186295))) lt!187048)))

(declare-fun b!120271 () Bool)

(declare-fun res!99565 () Bool)

(assert (=> b!120271 (=> (not res!99565) (not e!78765))))

(assert (=> b!120271 (= res!99565 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187048))))

(declare-fun b!120272 () Bool)

(declare-fun lt!187050 () (_ BitVec 64))

(assert (=> b!120272 (= e!78765 (bvsle lt!187048 (bvmul lt!187050 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120272 (or (= lt!187050 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187050 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187050)))))

(assert (=> b!120272 (= lt!187050 ((_ sign_extend 32) (size!2424 (buf!2852 (_1!5298 lt!186295)))))))

(assert (= (and d!38714 res!99566) b!120271))

(assert (= (and b!120271 res!99565) b!120272))

(declare-fun m!181653 () Bool)

(assert (=> d!38714 m!181653))

(declare-fun m!181655 () Bool)

(assert (=> d!38714 m!181655))

(assert (=> b!120002 d!38714))

(declare-fun d!38716 () Bool)

(assert (=> d!38716 (= (invariant!0 (currentBit!5520 thiss!1305) (currentByte!5525 thiss!1305) (size!2424 (buf!2852 (_2!5297 lt!186308)))) (and (bvsge (currentBit!5520 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5520 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5525 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5525 thiss!1305) (size!2424 (buf!2852 (_2!5297 lt!186308)))) (and (= (currentBit!5520 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5525 thiss!1305) (size!2424 (buf!2852 (_2!5297 lt!186308))))))))))

(assert (=> b!120001 d!38716))

(declare-fun d!38718 () Bool)

(declare-fun e!78766 () Bool)

(assert (=> d!38718 e!78766))

(declare-fun res!99568 () Bool)

(assert (=> d!38718 (=> (not res!99568) (not e!78766))))

(declare-fun lt!187054 () (_ BitVec 64))

(declare-fun lt!187058 () (_ BitVec 64))

(declare-fun lt!187057 () (_ BitVec 64))

(assert (=> d!38718 (= res!99568 (= lt!187054 (bvsub lt!187058 lt!187057)))))

(assert (=> d!38718 (or (= (bvand lt!187058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187057 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187058 lt!187057) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38718 (= lt!187057 (remainingBits!0 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186285)))) ((_ sign_extend 32) (currentByte!5525 (_2!5297 lt!186285))) ((_ sign_extend 32) (currentBit!5520 (_2!5297 lt!186285)))))))

(declare-fun lt!187055 () (_ BitVec 64))

(declare-fun lt!187053 () (_ BitVec 64))

(assert (=> d!38718 (= lt!187058 (bvmul lt!187055 lt!187053))))

(assert (=> d!38718 (or (= lt!187055 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187053 (bvsdiv (bvmul lt!187055 lt!187053) lt!187055)))))

(assert (=> d!38718 (= lt!187053 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38718 (= lt!187055 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186285)))))))

(assert (=> d!38718 (= lt!187054 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5525 (_2!5297 lt!186285))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5520 (_2!5297 lt!186285)))))))

(assert (=> d!38718 (invariant!0 (currentBit!5520 (_2!5297 lt!186285)) (currentByte!5525 (_2!5297 lt!186285)) (size!2424 (buf!2852 (_2!5297 lt!186285))))))

(assert (=> d!38718 (= (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))) lt!187054)))

(declare-fun b!120273 () Bool)

(declare-fun res!99567 () Bool)

(assert (=> b!120273 (=> (not res!99567) (not e!78766))))

(assert (=> b!120273 (= res!99567 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187054))))

(declare-fun b!120274 () Bool)

(declare-fun lt!187056 () (_ BitVec 64))

(assert (=> b!120274 (= e!78766 (bvsle lt!187054 (bvmul lt!187056 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120274 (or (= lt!187056 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187056 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187056)))))

(assert (=> b!120274 (= lt!187056 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186285)))))))

(assert (= (and d!38718 res!99568) b!120273))

(assert (= (and b!120273 res!99567) b!120274))

(declare-fun m!181657 () Bool)

(assert (=> d!38718 m!181657))

(assert (=> d!38718 m!181649))

(assert (=> b!120012 d!38718))

(declare-fun d!38720 () Bool)

(declare-fun e!78767 () Bool)

(assert (=> d!38720 e!78767))

(declare-fun res!99570 () Bool)

(assert (=> d!38720 (=> (not res!99570) (not e!78767))))

(declare-fun lt!187063 () (_ BitVec 64))

(declare-fun lt!187064 () (_ BitVec 64))

(declare-fun lt!187060 () (_ BitVec 64))

(assert (=> d!38720 (= res!99570 (= lt!187060 (bvsub lt!187064 lt!187063)))))

(assert (=> d!38720 (or (= (bvand lt!187064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187063 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187064 lt!187063) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38720 (= lt!187063 (remainingBits!0 ((_ sign_extend 32) (size!2424 (buf!2852 thiss!1305))) ((_ sign_extend 32) (currentByte!5525 thiss!1305)) ((_ sign_extend 32) (currentBit!5520 thiss!1305))))))

(declare-fun lt!187061 () (_ BitVec 64))

(declare-fun lt!187059 () (_ BitVec 64))

(assert (=> d!38720 (= lt!187064 (bvmul lt!187061 lt!187059))))

(assert (=> d!38720 (or (= lt!187061 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187059 (bvsdiv (bvmul lt!187061 lt!187059) lt!187061)))))

(assert (=> d!38720 (= lt!187059 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38720 (= lt!187061 ((_ sign_extend 32) (size!2424 (buf!2852 thiss!1305))))))

(assert (=> d!38720 (= lt!187060 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5525 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5520 thiss!1305))))))

(assert (=> d!38720 (invariant!0 (currentBit!5520 thiss!1305) (currentByte!5525 thiss!1305) (size!2424 (buf!2852 thiss!1305)))))

(assert (=> d!38720 (= (bitIndex!0 (size!2424 (buf!2852 thiss!1305)) (currentByte!5525 thiss!1305) (currentBit!5520 thiss!1305)) lt!187060)))

(declare-fun b!120275 () Bool)

(declare-fun res!99569 () Bool)

(assert (=> b!120275 (=> (not res!99569) (not e!78767))))

(assert (=> b!120275 (= res!99569 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187060))))

(declare-fun b!120276 () Bool)

(declare-fun lt!187062 () (_ BitVec 64))

(assert (=> b!120276 (= e!78767 (bvsle lt!187060 (bvmul lt!187062 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120276 (or (= lt!187062 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187062 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187062)))))

(assert (=> b!120276 (= lt!187062 ((_ sign_extend 32) (size!2424 (buf!2852 thiss!1305))))))

(assert (= (and d!38720 res!99570) b!120275))

(assert (= (and b!120275 res!99569) b!120276))

(assert (=> d!38720 m!181163))

(assert (=> d!38720 m!181651))

(assert (=> b!120012 d!38720))

(declare-fun d!38722 () Bool)

(declare-fun e!78770 () Bool)

(assert (=> d!38722 e!78770))

(declare-fun res!99573 () Bool)

(assert (=> d!38722 (=> (not res!99573) (not e!78770))))

(declare-fun lt!187069 () BitStream!4322)

(declare-fun lt!187070 () (_ BitVec 64))

(assert (=> d!38722 (= res!99573 (= (bvadd lt!187070 (bvsub (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))) lt!186298)) (bitIndex!0 (size!2424 (buf!2852 lt!187069)) (currentByte!5525 lt!187069) (currentBit!5520 lt!187069))))))

(assert (=> d!38722 (or (not (= (bvand lt!187070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))) lt!186298) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!187070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!187070 (bvsub (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))) lt!186298)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38722 (= lt!187070 (bitIndex!0 (size!2424 (buf!2852 (_2!5299 lt!186307))) (currentByte!5525 (_2!5299 lt!186307)) (currentBit!5520 (_2!5299 lt!186307))))))

(declare-fun moveBitIndex!0 (BitStream!4322 (_ BitVec 64)) tuple2!10064)

(assert (=> d!38722 (= lt!187069 (_2!5297 (moveBitIndex!0 (_2!5299 lt!186307) (bvsub (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))) lt!186298))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4322 (_ BitVec 64)) Bool)

(assert (=> d!38722 (moveBitIndexPrecond!0 (_2!5299 lt!186307) (bvsub (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))) lt!186298))))

(assert (=> d!38722 (= (withMovedBitIndex!0 (_2!5299 lt!186307) (bvsub (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186285))) (currentByte!5525 (_2!5297 lt!186285)) (currentBit!5520 (_2!5297 lt!186285))) lt!186298)) lt!187069)))

(declare-fun b!120279 () Bool)

(assert (=> b!120279 (= e!78770 (= (size!2424 (buf!2852 (_2!5299 lt!186307))) (size!2424 (buf!2852 lt!187069))))))

(assert (= (and d!38722 res!99573) b!120279))

(declare-fun m!181659 () Bool)

(assert (=> d!38722 m!181659))

(declare-fun m!181661 () Bool)

(assert (=> d!38722 m!181661))

(declare-fun m!181663 () Bool)

(assert (=> d!38722 m!181663))

(declare-fun m!181665 () Bool)

(assert (=> d!38722 m!181665))

(assert (=> b!120003 d!38722))

(declare-fun d!38724 () Bool)

(declare-fun e!78771 () Bool)

(assert (=> d!38724 e!78771))

(declare-fun res!99574 () Bool)

(assert (=> d!38724 (=> (not res!99574) (not e!78771))))

(declare-fun lt!187071 () BitStream!4322)

(declare-fun lt!187072 () (_ BitVec 64))

(assert (=> d!38724 (= res!99574 (= (bvadd lt!187072 (bvsub lt!186294 lt!186298)) (bitIndex!0 (size!2424 (buf!2852 lt!187071)) (currentByte!5525 lt!187071) (currentBit!5520 lt!187071))))))

(assert (=> d!38724 (or (not (= (bvand lt!187072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186294 lt!186298) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!187072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!187072 (bvsub lt!186294 lt!186298)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38724 (= lt!187072 (bitIndex!0 (size!2424 (buf!2852 (_2!5299 lt!186301))) (currentByte!5525 (_2!5299 lt!186301)) (currentBit!5520 (_2!5299 lt!186301))))))

(assert (=> d!38724 (= lt!187071 (_2!5297 (moveBitIndex!0 (_2!5299 lt!186301) (bvsub lt!186294 lt!186298))))))

(assert (=> d!38724 (moveBitIndexPrecond!0 (_2!5299 lt!186301) (bvsub lt!186294 lt!186298))))

(assert (=> d!38724 (= (withMovedBitIndex!0 (_2!5299 lt!186301) (bvsub lt!186294 lt!186298)) lt!187071)))

(declare-fun b!120280 () Bool)

(assert (=> b!120280 (= e!78771 (= (size!2424 (buf!2852 (_2!5299 lt!186301))) (size!2424 (buf!2852 lt!187071))))))

(assert (= (and d!38724 res!99574) b!120280))

(declare-fun m!181667 () Bool)

(assert (=> d!38724 m!181667))

(declare-fun m!181669 () Bool)

(assert (=> d!38724 m!181669))

(declare-fun m!181671 () Bool)

(assert (=> d!38724 m!181671))

(declare-fun m!181673 () Bool)

(assert (=> d!38724 m!181673))

(assert (=> b!120003 d!38724))

(declare-fun lt!187073 () tuple2!10076)

(declare-fun d!38726 () Bool)

(assert (=> d!38726 (= lt!187073 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5299 lt!186301) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186299))))

(assert (=> d!38726 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5299 lt!186301) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186299) (tuple2!10071 (_2!5303 lt!187073) (_1!5303 lt!187073)))))

(declare-fun bs!9368 () Bool)

(assert (= bs!9368 d!38726))

(assert (=> bs!9368 m!181095))

(declare-fun m!181675 () Bool)

(assert (=> bs!9368 m!181675))

(assert (=> b!120003 d!38726))

(declare-fun d!38728 () Bool)

(declare-fun e!78772 () Bool)

(assert (=> d!38728 e!78772))

(declare-fun res!99576 () Bool)

(assert (=> d!38728 (=> (not res!99576) (not e!78772))))

(declare-fun lt!187078 () (_ BitVec 64))

(declare-fun lt!187079 () (_ BitVec 64))

(declare-fun lt!187075 () (_ BitVec 64))

(assert (=> d!38728 (= res!99576 (= lt!187075 (bvsub lt!187079 lt!187078)))))

(assert (=> d!38728 (or (= (bvand lt!187079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187078 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187079 lt!187078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38728 (= lt!187078 (remainingBits!0 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186308)))) ((_ sign_extend 32) (currentByte!5525 (_2!5297 lt!186308))) ((_ sign_extend 32) (currentBit!5520 (_2!5297 lt!186308)))))))

(declare-fun lt!187076 () (_ BitVec 64))

(declare-fun lt!187074 () (_ BitVec 64))

(assert (=> d!38728 (= lt!187079 (bvmul lt!187076 lt!187074))))

(assert (=> d!38728 (or (= lt!187076 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187074 (bvsdiv (bvmul lt!187076 lt!187074) lt!187076)))))

(assert (=> d!38728 (= lt!187074 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38728 (= lt!187076 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186308)))))))

(assert (=> d!38728 (= lt!187075 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5525 (_2!5297 lt!186308))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5520 (_2!5297 lt!186308)))))))

(assert (=> d!38728 (invariant!0 (currentBit!5520 (_2!5297 lt!186308)) (currentByte!5525 (_2!5297 lt!186308)) (size!2424 (buf!2852 (_2!5297 lt!186308))))))

(assert (=> d!38728 (= (bitIndex!0 (size!2424 (buf!2852 (_2!5297 lt!186308))) (currentByte!5525 (_2!5297 lt!186308)) (currentBit!5520 (_2!5297 lt!186308))) lt!187075)))

(declare-fun b!120281 () Bool)

(declare-fun res!99575 () Bool)

(assert (=> b!120281 (=> (not res!99575) (not e!78772))))

(assert (=> b!120281 (= res!99575 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187075))))

(declare-fun b!120282 () Bool)

(declare-fun lt!187077 () (_ BitVec 64))

(assert (=> b!120282 (= e!78772 (bvsle lt!187075 (bvmul lt!187077 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120282 (or (= lt!187077 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187077 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187077)))))

(assert (=> b!120282 (= lt!187077 ((_ sign_extend 32) (size!2424 (buf!2852 (_2!5297 lt!186308)))))))

(assert (= (and d!38728 res!99576) b!120281))

(assert (= (and b!120281 res!99575) b!120282))

(declare-fun m!181677 () Bool)

(assert (=> d!38728 m!181677))

(declare-fun m!181679 () Bool)

(assert (=> d!38728 m!181679))

(assert (=> b!120003 d!38728))

(assert (=> b!120003 d!38718))

(assert (=> b!120003 d!38720))

(declare-fun d!38730 () Bool)

(declare-fun e!78773 () Bool)

(assert (=> d!38730 e!78773))

(declare-fun res!99577 () Bool)

(assert (=> d!38730 (=> (not res!99577) (not e!78773))))

(declare-fun lt!187081 () (_ BitVec 64))

(declare-fun lt!187080 () BitStream!4322)

(assert (=> d!38730 (= res!99577 (= (bvadd lt!187081 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2424 (buf!2852 lt!187080)) (currentByte!5525 lt!187080) (currentBit!5520 lt!187080))))))

(assert (=> d!38730 (or (not (= (bvand lt!187081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!187081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!187081 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38730 (= lt!187081 (bitIndex!0 (size!2424 (buf!2852 (_1!5299 lt!186301))) (currentByte!5525 (_1!5299 lt!186301)) (currentBit!5520 (_1!5299 lt!186301))))))

(assert (=> d!38730 (= lt!187080 (_2!5297 (moveBitIndex!0 (_1!5299 lt!186301) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!38730 (moveBitIndexPrecond!0 (_1!5299 lt!186301) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38730 (= (withMovedBitIndex!0 (_1!5299 lt!186301) #b0000000000000000000000000000000000000000000000000000000000000001) lt!187080)))

(declare-fun b!120283 () Bool)

(assert (=> b!120283 (= e!78773 (= (size!2424 (buf!2852 (_1!5299 lt!186301))) (size!2424 (buf!2852 lt!187080))))))

(assert (= (and d!38730 res!99577) b!120283))

(declare-fun m!181681 () Bool)

(assert (=> d!38730 m!181681))

(declare-fun m!181683 () Bool)

(assert (=> d!38730 m!181683))

(declare-fun m!181685 () Bool)

(assert (=> d!38730 m!181685))

(declare-fun m!181687 () Bool)

(assert (=> d!38730 m!181687))

(assert (=> b!120003 d!38730))

(declare-fun d!38732 () Bool)

(declare-fun lt!187097 () tuple2!10070)

(declare-fun lt!187099 () tuple2!10070)

(assert (=> d!38732 (and (= (_2!5300 lt!187097) (_2!5300 lt!187099)) (= (_1!5300 lt!187097) (_1!5300 lt!187099)))))

(declare-fun lt!187096 () Bool)

(declare-fun lt!187098 () Unit!7391)

(declare-fun lt!187095 () BitStream!4322)

(declare-fun lt!187094 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!4322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10070 tuple2!10070 BitStream!4322 (_ BitVec 64) Bool BitStream!4322 (_ BitVec 64) tuple2!10070 tuple2!10070 BitStream!4322 (_ BitVec 64)) Unit!7391)

(assert (=> d!38732 (= lt!187098 (choose!45 (_1!5299 lt!186301) nBits!396 i!615 lt!186304 lt!187097 (tuple2!10071 (_1!5300 lt!187097) (_2!5300 lt!187097)) (_1!5300 lt!187097) (_2!5300 lt!187097) lt!187096 lt!187095 lt!187094 lt!187099 (tuple2!10071 (_1!5300 lt!187099) (_2!5300 lt!187099)) (_1!5300 lt!187099) (_2!5300 lt!187099)))))

(assert (=> d!38732 (= lt!187099 (readNLeastSignificantBitsLoopPure!0 lt!187095 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!187094))))

(assert (=> d!38732 (= lt!187094 (bvor lt!186304 (ite lt!187096 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38732 (= lt!187095 (withMovedBitIndex!0 (_1!5299 lt!186301) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38732 (= lt!187096 (_2!5298 (readBitPure!0 (_1!5299 lt!186301))))))

(assert (=> d!38732 (= lt!187097 (readNLeastSignificantBitsLoopPure!0 (_1!5299 lt!186301) nBits!396 i!615 lt!186304))))

(assert (=> d!38732 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5299 lt!186301) nBits!396 i!615 lt!186304) lt!187098)))

(declare-fun bs!9370 () Bool)

(assert (= bs!9370 d!38732))

(assert (=> bs!9370 m!181075))

(assert (=> bs!9370 m!181065))

(assert (=> bs!9370 m!181095))

(declare-fun m!181689 () Bool)

(assert (=> bs!9370 m!181689))

(declare-fun m!181691 () Bool)

(assert (=> bs!9370 m!181691))

(assert (=> b!120003 d!38732))

(declare-fun d!38734 () Bool)

(assert (=> d!38734 (= (array_inv!2226 (buf!2852 thiss!1305)) (bvsge (size!2424 (buf!2852 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!120013 d!38734))

(push 1)

(assert (not b!120247))

(assert (not b!120091))

(assert (not b!120257))

(assert (not d!38728))

(assert (not b!120075))

(assert (not b!120059))

(assert (not b!120073))

(assert (not d!38730))

(assert (not b!120078))

(assert (not d!38732))

(assert (not b!120248))

(assert (not d!38572))

(assert (not d!38720))

(assert (not d!38722))

(assert (not d!38588))

(assert (not d!38600))

(assert (not b!120249))

(assert (not b!120081))

(assert (not d!38606))

(assert (not d!38612))

(assert (not d!38604))

(assert (not b!120270))

(assert (not d!38608))

(assert (not b!120256))

(assert (not d!38702))

(assert (not d!38596))

(assert (not d!38714))

(assert (not d!38726))

(assert (not d!38700))

(assert (not b!120076))

(assert (not d!38590))

(assert (not d!38598))

(assert (not b!120039))

(assert (not b!120094))

(assert (not b!120252))

(assert (not d!38610))

(assert (not d!38718))

(assert (not d!38710))

(assert (not d!38706))

(assert (not b!120093))

(assert (not b!120092))

(assert (not d!38602))

(assert (not d!38724))

(assert (not b!120250))

(assert (not b!120072))

(assert (not b!120251))

(assert (not d!38698))

(assert (not d!38708))

(assert (not b!120061))

(assert (not d!38712))

(assert (not b!120080))

(assert (not b!120077))

(assert (not b!120259))

(assert (not bm!1565))

(assert (not b!120037))

(assert (not d!38704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

