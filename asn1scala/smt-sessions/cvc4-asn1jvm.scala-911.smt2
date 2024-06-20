; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25544 () Bool)

(assert start!25544)

(declare-fun b!130189 () Bool)

(declare-fun e!86298 () Bool)

(declare-datatypes ((array!6029 0))(
  ( (array!6030 (arr!3347 (Array (_ BitVec 32) (_ BitVec 8))) (size!2730 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4724 0))(
  ( (BitStream!4725 (buf!3088 array!6029) (currentByte!5849 (_ BitVec 32)) (currentBit!5844 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11198 0))(
  ( (tuple2!11199 (_1!5896 BitStream!4724) (_2!5896 BitStream!4724)) )
))
(declare-fun lt!200759 () tuple2!11198)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130189 (= e!86298 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!2730 (buf!3088 (_1!5896 lt!200759)))) ((_ sign_extend 32) (currentByte!5849 (_1!5896 lt!200759))) ((_ sign_extend 32) (currentBit!5844 (_1!5896 lt!200759))))))))

(declare-fun lt!200756 () tuple2!11198)

(declare-datatypes ((Unit!8065 0))(
  ( (Unit!8066) )
))
(declare-datatypes ((tuple2!11200 0))(
  ( (tuple2!11201 (_1!5897 Unit!8065) (_2!5897 BitStream!4724)) )
))
(declare-fun lt!200763 () tuple2!11200)

(declare-fun lt!200770 () tuple2!11200)

(declare-fun reader!0 (BitStream!4724 BitStream!4724) tuple2!11198)

(assert (=> b!130189 (= lt!200756 (reader!0 (_2!5897 lt!200763) (_2!5897 lt!200770)))))

(declare-fun thiss!1634 () BitStream!4724)

(assert (=> b!130189 (= lt!200759 (reader!0 thiss!1634 (_2!5897 lt!200770)))))

(declare-fun e!86300 () Bool)

(assert (=> b!130189 e!86300))

(declare-fun res!107896 () Bool)

(assert (=> b!130189 (=> (not res!107896) (not e!86300))))

(declare-datatypes ((tuple2!11202 0))(
  ( (tuple2!11203 (_1!5898 BitStream!4724) (_2!5898 (_ BitVec 8))) )
))
(declare-fun lt!200757 () tuple2!11202)

(declare-fun lt!200766 () tuple2!11202)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130189 (= res!107896 (= (bitIndex!0 (size!2730 (buf!3088 (_1!5898 lt!200757))) (currentByte!5849 (_1!5898 lt!200757)) (currentBit!5844 (_1!5898 lt!200757))) (bitIndex!0 (size!2730 (buf!3088 (_1!5898 lt!200766))) (currentByte!5849 (_1!5898 lt!200766)) (currentBit!5844 (_1!5898 lt!200766)))))))

(declare-fun lt!200761 () Unit!8065)

(declare-fun lt!200758 () BitStream!4724)

(declare-fun readBytePrefixLemma!0 (BitStream!4724 BitStream!4724) Unit!8065)

(assert (=> b!130189 (= lt!200761 (readBytePrefixLemma!0 lt!200758 (_2!5897 lt!200770)))))

(declare-fun readBytePure!0 (BitStream!4724) tuple2!11202)

(assert (=> b!130189 (= lt!200766 (readBytePure!0 (BitStream!4725 (buf!3088 (_2!5897 lt!200770)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634))))))

(assert (=> b!130189 (= lt!200757 (readBytePure!0 lt!200758))))

(assert (=> b!130189 (= lt!200758 (BitStream!4725 (buf!3088 (_2!5897 lt!200763)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634)))))

(declare-fun e!86296 () Bool)

(assert (=> b!130189 e!86296))

(declare-fun res!107898 () Bool)

(assert (=> b!130189 (=> (not res!107898) (not e!86296))))

(declare-fun isPrefixOf!0 (BitStream!4724 BitStream!4724) Bool)

(assert (=> b!130189 (= res!107898 (isPrefixOf!0 thiss!1634 (_2!5897 lt!200770)))))

(declare-fun lt!200767 () Unit!8065)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4724 BitStream!4724 BitStream!4724) Unit!8065)

(assert (=> b!130189 (= lt!200767 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5897 lt!200763) (_2!5897 lt!200770)))))

(declare-fun e!86295 () Bool)

(assert (=> b!130189 e!86295))

(declare-fun res!107903 () Bool)

(assert (=> b!130189 (=> (not res!107903) (not e!86295))))

(assert (=> b!130189 (= res!107903 (= (size!2730 (buf!3088 (_2!5897 lt!200763))) (size!2730 (buf!3088 (_2!5897 lt!200770)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun arr!237 () array!6029)

(declare-fun appendByteArrayLoop!0 (BitStream!4724 array!6029 (_ BitVec 32) (_ BitVec 32)) tuple2!11200)

(assert (=> b!130189 (= lt!200770 (appendByteArrayLoop!0 (_2!5897 lt!200763) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130189 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200763)))) ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200763))) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200763))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200771 () Unit!8065)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4724 BitStream!4724 (_ BitVec 64) (_ BitVec 32)) Unit!8065)

(assert (=> b!130189 (= lt!200771 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5897 lt!200763) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!86292 () Bool)

(assert (=> b!130189 e!86292))

(declare-fun res!107906 () Bool)

(assert (=> b!130189 (=> (not res!107906) (not e!86292))))

(assert (=> b!130189 (= res!107906 (= (size!2730 (buf!3088 thiss!1634)) (size!2730 (buf!3088 (_2!5897 lt!200763)))))))

(declare-fun appendByte!0 (BitStream!4724 (_ BitVec 8)) tuple2!11200)

(assert (=> b!130189 (= lt!200763 (appendByte!0 thiss!1634 (select (arr!3347 arr!237) from!447)))))

(declare-fun lt!200765 () tuple2!11202)

(declare-fun lt!200768 () tuple2!11198)

(declare-fun b!130190 () Bool)

(assert (=> b!130190 (= e!86292 (and (= (_2!5898 lt!200765) (select (arr!3347 arr!237) from!447)) (= (_1!5898 lt!200765) (_2!5896 lt!200768))))))

(assert (=> b!130190 (= lt!200765 (readBytePure!0 (_1!5896 lt!200768)))))

(assert (=> b!130190 (= lt!200768 (reader!0 thiss!1634 (_2!5897 lt!200763)))))

(declare-fun b!130191 () Bool)

(declare-fun res!107907 () Bool)

(assert (=> b!130191 (=> (not res!107907) (not e!86298))))

(assert (=> b!130191 (= res!107907 (bvslt from!447 to!404))))

(declare-fun b!130192 () Bool)

(declare-fun e!86297 () Bool)

(declare-fun e!86299 () Bool)

(assert (=> b!130192 (= e!86297 (not e!86299))))

(declare-fun res!107901 () Bool)

(assert (=> b!130192 (=> res!107901 e!86299)))

(declare-fun lt!200760 () tuple2!11198)

(declare-datatypes ((tuple2!11204 0))(
  ( (tuple2!11205 (_1!5899 BitStream!4724) (_2!5899 array!6029)) )
))
(declare-fun lt!200769 () tuple2!11204)

(assert (=> b!130192 (= res!107901 (or (not (= (size!2730 (_2!5899 lt!200769)) (size!2730 arr!237))) (not (= (_1!5899 lt!200769) (_2!5896 lt!200760)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4724 array!6029 (_ BitVec 32) (_ BitVec 32)) tuple2!11204)

(assert (=> b!130192 (= lt!200769 (readByteArrayLoopPure!0 (_1!5896 lt!200760) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!200762 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130192 (validate_offset_bits!1 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200770)))) ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200763))) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200763))) lt!200762)))

(declare-fun lt!200764 () Unit!8065)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4724 array!6029 (_ BitVec 64)) Unit!8065)

(assert (=> b!130192 (= lt!200764 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5897 lt!200763) (buf!3088 (_2!5897 lt!200770)) lt!200762))))

(assert (=> b!130192 (= lt!200760 (reader!0 (_2!5897 lt!200763) (_2!5897 lt!200770)))))

(declare-fun b!130193 () Bool)

(declare-fun res!107899 () Bool)

(assert (=> b!130193 (=> (not res!107899) (not e!86298))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130193 (= res!107899 (invariant!0 (currentBit!5844 thiss!1634) (currentByte!5849 thiss!1634) (size!2730 (buf!3088 thiss!1634))))))

(declare-fun res!107908 () Bool)

(assert (=> start!25544 (=> (not res!107908) (not e!86298))))

(assert (=> start!25544 (= res!107908 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2730 arr!237))))))

(assert (=> start!25544 e!86298))

(assert (=> start!25544 true))

(declare-fun array_inv!2519 (array!6029) Bool)

(assert (=> start!25544 (array_inv!2519 arr!237)))

(declare-fun e!86293 () Bool)

(declare-fun inv!12 (BitStream!4724) Bool)

(assert (=> start!25544 (and (inv!12 thiss!1634) e!86293)))

(declare-fun b!130194 () Bool)

(assert (=> b!130194 (= e!86293 (array_inv!2519 (buf!3088 thiss!1634)))))

(declare-fun b!130195 () Bool)

(declare-fun res!107897 () Bool)

(assert (=> b!130195 (=> (not res!107897) (not e!86297))))

(assert (=> b!130195 (= res!107897 (isPrefixOf!0 (_2!5897 lt!200763) (_2!5897 lt!200770)))))

(declare-fun b!130196 () Bool)

(declare-fun res!107902 () Bool)

(assert (=> b!130196 (=> (not res!107902) (not e!86292))))

(assert (=> b!130196 (= res!107902 (isPrefixOf!0 thiss!1634 (_2!5897 lt!200763)))))

(declare-fun b!130197 () Bool)

(declare-fun res!107900 () Bool)

(assert (=> b!130197 (=> (not res!107900) (not e!86292))))

(assert (=> b!130197 (= res!107900 (= (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200763))) (currentByte!5849 (_2!5897 lt!200763)) (currentBit!5844 (_2!5897 lt!200763))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2730 (buf!3088 thiss!1634)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634)))))))

(declare-fun b!130198 () Bool)

(assert (=> b!130198 (= e!86300 (= (_2!5898 lt!200757) (_2!5898 lt!200766)))))

(declare-fun b!130199 () Bool)

(declare-fun res!107904 () Bool)

(assert (=> b!130199 (=> (not res!107904) (not e!86298))))

(assert (=> b!130199 (= res!107904 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2730 (buf!3088 thiss!1634))) ((_ sign_extend 32) (currentByte!5849 thiss!1634)) ((_ sign_extend 32) (currentBit!5844 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!130200 () Bool)

(declare-fun arrayRangesEq!133 (array!6029 array!6029 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130200 (= e!86299 (not (arrayRangesEq!133 arr!237 (_2!5899 lt!200769) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130201 () Bool)

(assert (=> b!130201 (= e!86296 (invariant!0 (currentBit!5844 thiss!1634) (currentByte!5849 thiss!1634) (size!2730 (buf!3088 (_2!5897 lt!200763)))))))

(declare-fun b!130202 () Bool)

(assert (=> b!130202 (= e!86295 e!86297)))

(declare-fun res!107905 () Bool)

(assert (=> b!130202 (=> (not res!107905) (not e!86297))))

(assert (=> b!130202 (= res!107905 (= (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200770))) (currentByte!5849 (_2!5897 lt!200770)) (currentBit!5844 (_2!5897 lt!200770))) (bvadd (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200763))) (currentByte!5849 (_2!5897 lt!200763)) (currentBit!5844 (_2!5897 lt!200763))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200762))))))

(assert (=> b!130202 (= lt!200762 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!25544 res!107908) b!130199))

(assert (= (and b!130199 res!107904) b!130191))

(assert (= (and b!130191 res!107907) b!130193))

(assert (= (and b!130193 res!107899) b!130189))

(assert (= (and b!130189 res!107906) b!130197))

(assert (= (and b!130197 res!107900) b!130196))

(assert (= (and b!130196 res!107902) b!130190))

(assert (= (and b!130189 res!107903) b!130202))

(assert (= (and b!130202 res!107905) b!130195))

(assert (= (and b!130195 res!107897) b!130192))

(assert (= (and b!130192 (not res!107901)) b!130200))

(assert (= (and b!130189 res!107898) b!130201))

(assert (= (and b!130189 res!107896) b!130198))

(assert (= start!25544 b!130194))

(declare-fun m!196275 () Bool)

(assert (=> b!130190 m!196275))

(declare-fun m!196277 () Bool)

(assert (=> b!130190 m!196277))

(declare-fun m!196279 () Bool)

(assert (=> b!130190 m!196279))

(declare-fun m!196281 () Bool)

(assert (=> b!130200 m!196281))

(declare-fun m!196283 () Bool)

(assert (=> b!130193 m!196283))

(declare-fun m!196285 () Bool)

(assert (=> b!130202 m!196285))

(declare-fun m!196287 () Bool)

(assert (=> b!130202 m!196287))

(declare-fun m!196289 () Bool)

(assert (=> b!130192 m!196289))

(declare-fun m!196291 () Bool)

(assert (=> b!130192 m!196291))

(declare-fun m!196293 () Bool)

(assert (=> b!130192 m!196293))

(declare-fun m!196295 () Bool)

(assert (=> b!130192 m!196295))

(assert (=> b!130197 m!196287))

(declare-fun m!196297 () Bool)

(assert (=> b!130197 m!196297))

(declare-fun m!196299 () Bool)

(assert (=> b!130201 m!196299))

(declare-fun m!196301 () Bool)

(assert (=> b!130195 m!196301))

(declare-fun m!196303 () Bool)

(assert (=> b!130196 m!196303))

(assert (=> b!130189 m!196295))

(declare-fun m!196305 () Bool)

(assert (=> b!130189 m!196305))

(declare-fun m!196307 () Bool)

(assert (=> b!130189 m!196307))

(declare-fun m!196309 () Bool)

(assert (=> b!130189 m!196309))

(declare-fun m!196311 () Bool)

(assert (=> b!130189 m!196311))

(declare-fun m!196313 () Bool)

(assert (=> b!130189 m!196313))

(declare-fun m!196315 () Bool)

(assert (=> b!130189 m!196315))

(assert (=> b!130189 m!196275))

(declare-fun m!196317 () Bool)

(assert (=> b!130189 m!196317))

(assert (=> b!130189 m!196275))

(declare-fun m!196319 () Bool)

(assert (=> b!130189 m!196319))

(declare-fun m!196321 () Bool)

(assert (=> b!130189 m!196321))

(declare-fun m!196323 () Bool)

(assert (=> b!130189 m!196323))

(declare-fun m!196325 () Bool)

(assert (=> b!130189 m!196325))

(declare-fun m!196327 () Bool)

(assert (=> b!130189 m!196327))

(declare-fun m!196329 () Bool)

(assert (=> b!130189 m!196329))

(declare-fun m!196331 () Bool)

(assert (=> b!130199 m!196331))

(declare-fun m!196333 () Bool)

(assert (=> start!25544 m!196333))

(declare-fun m!196335 () Bool)

(assert (=> start!25544 m!196335))

(declare-fun m!196337 () Bool)

(assert (=> b!130194 m!196337))

(push 1)

(assert (not b!130196))

(assert (not b!130195))

(assert (not b!130189))

(assert (not start!25544))

(assert (not b!130190))

(assert (not b!130200))

(assert (not b!130192))

(assert (not b!130201))

(assert (not b!130197))

(assert (not b!130202))

(assert (not b!130193))

(assert (not b!130194))

(assert (not b!130199))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41588 () Bool)

(declare-fun res!107993 () Bool)

(declare-fun e!86355 () Bool)

(assert (=> d!41588 (=> res!107993 e!86355)))

(assert (=> d!41588 (= res!107993 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!41588 (= (arrayRangesEq!133 arr!237 (_2!5899 lt!200769) #b00000000000000000000000000000000 to!404) e!86355)))

(declare-fun b!130295 () Bool)

(declare-fun e!86356 () Bool)

(assert (=> b!130295 (= e!86355 e!86356)))

(declare-fun res!107994 () Bool)

(assert (=> b!130295 (=> (not res!107994) (not e!86356))))

(assert (=> b!130295 (= res!107994 (= (select (arr!3347 arr!237) #b00000000000000000000000000000000) (select (arr!3347 (_2!5899 lt!200769)) #b00000000000000000000000000000000)))))

(declare-fun b!130296 () Bool)

(assert (=> b!130296 (= e!86356 (arrayRangesEq!133 arr!237 (_2!5899 lt!200769) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!41588 (not res!107993)) b!130295))

(assert (= (and b!130295 res!107994) b!130296))

(declare-fun m!196467 () Bool)

(assert (=> b!130295 m!196467))

(declare-fun m!196469 () Bool)

(assert (=> b!130295 m!196469))

(declare-fun m!196471 () Bool)

(assert (=> b!130296 m!196471))

(assert (=> b!130200 d!41588))

(declare-fun b!130330 () Bool)

(declare-fun res!108024 () Bool)

(declare-fun e!86377 () Bool)

(assert (=> b!130330 (=> (not res!108024) (not e!86377))))

(declare-fun lt!201066 () tuple2!11198)

(assert (=> b!130330 (= res!108024 (isPrefixOf!0 (_2!5896 lt!201066) (_2!5897 lt!200770)))))

(declare-fun d!41592 () Bool)

(assert (=> d!41592 e!86377))

(declare-fun res!108026 () Bool)

(assert (=> d!41592 (=> (not res!108026) (not e!86377))))

(assert (=> d!41592 (= res!108026 (isPrefixOf!0 (_1!5896 lt!201066) (_2!5896 lt!201066)))))

(declare-fun lt!201081 () BitStream!4724)

(assert (=> d!41592 (= lt!201066 (tuple2!11199 lt!201081 (_2!5897 lt!200770)))))

(declare-fun lt!201079 () Unit!8065)

(declare-fun lt!201065 () Unit!8065)

(assert (=> d!41592 (= lt!201079 lt!201065)))

(assert (=> d!41592 (isPrefixOf!0 lt!201081 (_2!5897 lt!200770))))

(assert (=> d!41592 (= lt!201065 (lemmaIsPrefixTransitive!0 lt!201081 (_2!5897 lt!200770) (_2!5897 lt!200770)))))

(declare-fun lt!201080 () Unit!8065)

(declare-fun lt!201073 () Unit!8065)

(assert (=> d!41592 (= lt!201080 lt!201073)))

(assert (=> d!41592 (isPrefixOf!0 lt!201081 (_2!5897 lt!200770))))

(assert (=> d!41592 (= lt!201073 (lemmaIsPrefixTransitive!0 lt!201081 thiss!1634 (_2!5897 lt!200770)))))

(declare-fun lt!201062 () Unit!8065)

(declare-fun e!86376 () Unit!8065)

(assert (=> d!41592 (= lt!201062 e!86376)))

(declare-fun c!7546 () Bool)

(assert (=> d!41592 (= c!7546 (not (= (size!2730 (buf!3088 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!201071 () Unit!8065)

(declare-fun lt!201077 () Unit!8065)

(assert (=> d!41592 (= lt!201071 lt!201077)))

(assert (=> d!41592 (isPrefixOf!0 (_2!5897 lt!200770) (_2!5897 lt!200770))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4724) Unit!8065)

(assert (=> d!41592 (= lt!201077 (lemmaIsPrefixRefl!0 (_2!5897 lt!200770)))))

(declare-fun lt!201069 () Unit!8065)

(declare-fun lt!201074 () Unit!8065)

(assert (=> d!41592 (= lt!201069 lt!201074)))

(assert (=> d!41592 (= lt!201074 (lemmaIsPrefixRefl!0 (_2!5897 lt!200770)))))

(declare-fun lt!201070 () Unit!8065)

(declare-fun lt!201075 () Unit!8065)

(assert (=> d!41592 (= lt!201070 lt!201075)))

(assert (=> d!41592 (isPrefixOf!0 lt!201081 lt!201081)))

(assert (=> d!41592 (= lt!201075 (lemmaIsPrefixRefl!0 lt!201081))))

(declare-fun lt!201067 () Unit!8065)

(declare-fun lt!201072 () Unit!8065)

(assert (=> d!41592 (= lt!201067 lt!201072)))

(assert (=> d!41592 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41592 (= lt!201072 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41592 (= lt!201081 (BitStream!4725 (buf!3088 (_2!5897 lt!200770)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634)))))

(assert (=> d!41592 (isPrefixOf!0 thiss!1634 (_2!5897 lt!200770))))

(assert (=> d!41592 (= (reader!0 thiss!1634 (_2!5897 lt!200770)) lt!201066)))

(declare-fun b!130331 () Bool)

(declare-fun res!108025 () Bool)

(assert (=> b!130331 (=> (not res!108025) (not e!86377))))

(assert (=> b!130331 (= res!108025 (isPrefixOf!0 (_1!5896 lt!201066) thiss!1634))))

(declare-fun b!130332 () Bool)

(declare-fun lt!201064 () Unit!8065)

(assert (=> b!130332 (= e!86376 lt!201064)))

(declare-fun lt!201076 () (_ BitVec 64))

(assert (=> b!130332 (= lt!201076 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!201063 () (_ BitVec 64))

(assert (=> b!130332 (= lt!201063 (bitIndex!0 (size!2730 (buf!3088 thiss!1634)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6029 array!6029 (_ BitVec 64) (_ BitVec 64)) Unit!8065)

(assert (=> b!130332 (= lt!201064 (arrayBitRangesEqSymmetric!0 (buf!3088 thiss!1634) (buf!3088 (_2!5897 lt!200770)) lt!201076 lt!201063))))

(declare-fun arrayBitRangesEq!0 (array!6029 array!6029 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130332 (arrayBitRangesEq!0 (buf!3088 (_2!5897 lt!200770)) (buf!3088 thiss!1634) lt!201076 lt!201063)))

(declare-fun b!130333 () Bool)

(declare-fun lt!201078 () (_ BitVec 64))

(declare-fun lt!201068 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4724 (_ BitVec 64)) BitStream!4724)

(assert (=> b!130333 (= e!86377 (= (_1!5896 lt!201066) (withMovedBitIndex!0 (_2!5896 lt!201066) (bvsub lt!201068 lt!201078))))))

(assert (=> b!130333 (or (= (bvand lt!201068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201078 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!201068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!201068 lt!201078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130333 (= lt!201078 (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200770))) (currentByte!5849 (_2!5897 lt!200770)) (currentBit!5844 (_2!5897 lt!200770))))))

(assert (=> b!130333 (= lt!201068 (bitIndex!0 (size!2730 (buf!3088 thiss!1634)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634)))))

(declare-fun b!130334 () Bool)

(declare-fun Unit!8070 () Unit!8065)

(assert (=> b!130334 (= e!86376 Unit!8070)))

(assert (= (and d!41592 c!7546) b!130332))

(assert (= (and d!41592 (not c!7546)) b!130334))

(assert (= (and d!41592 res!108026) b!130331))

(assert (= (and b!130331 res!108025) b!130330))

(assert (= (and b!130330 res!108024) b!130333))

(declare-fun m!196511 () Bool)

(assert (=> b!130330 m!196511))

(declare-fun m!196513 () Bool)

(assert (=> b!130331 m!196513))

(assert (=> d!41592 m!196307))

(declare-fun m!196515 () Bool)

(assert (=> d!41592 m!196515))

(declare-fun m!196517 () Bool)

(assert (=> d!41592 m!196517))

(declare-fun m!196519 () Bool)

(assert (=> d!41592 m!196519))

(declare-fun m!196521 () Bool)

(assert (=> d!41592 m!196521))

(declare-fun m!196523 () Bool)

(assert (=> d!41592 m!196523))

(declare-fun m!196525 () Bool)

(assert (=> d!41592 m!196525))

(declare-fun m!196527 () Bool)

(assert (=> d!41592 m!196527))

(declare-fun m!196529 () Bool)

(assert (=> d!41592 m!196529))

(declare-fun m!196531 () Bool)

(assert (=> d!41592 m!196531))

(declare-fun m!196533 () Bool)

(assert (=> d!41592 m!196533))

(assert (=> b!130332 m!196297))

(declare-fun m!196535 () Bool)

(assert (=> b!130332 m!196535))

(declare-fun m!196537 () Bool)

(assert (=> b!130332 m!196537))

(declare-fun m!196539 () Bool)

(assert (=> b!130333 m!196539))

(assert (=> b!130333 m!196285))

(assert (=> b!130333 m!196297))

(assert (=> b!130189 d!41592))

(declare-fun d!41614 () Bool)

(assert (=> d!41614 (isPrefixOf!0 thiss!1634 (_2!5897 lt!200770))))

(declare-fun lt!201084 () Unit!8065)

(declare-fun choose!30 (BitStream!4724 BitStream!4724 BitStream!4724) Unit!8065)

(assert (=> d!41614 (= lt!201084 (choose!30 thiss!1634 (_2!5897 lt!200763) (_2!5897 lt!200770)))))

(assert (=> d!41614 (isPrefixOf!0 thiss!1634 (_2!5897 lt!200763))))

(assert (=> d!41614 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5897 lt!200763) (_2!5897 lt!200770)) lt!201084)))

(declare-fun bs!10153 () Bool)

(assert (= bs!10153 d!41614))

(assert (=> bs!10153 m!196307))

(declare-fun m!196541 () Bool)

(assert (=> bs!10153 m!196541))

(assert (=> bs!10153 m!196303))

(assert (=> b!130189 d!41614))

(declare-fun b!130385 () Bool)

(declare-fun e!86404 () Bool)

(declare-fun lt!201244 () (_ BitVec 64))

(assert (=> b!130385 (= e!86404 (validate_offset_bits!1 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200763)))) ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200763))) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200763))) lt!201244))))

(declare-fun b!130386 () Bool)

(declare-fun res!108067 () Bool)

(declare-fun e!86403 () Bool)

(assert (=> b!130386 (=> (not res!108067) (not e!86403))))

(declare-fun lt!201239 () tuple2!11200)

(assert (=> b!130386 (= res!108067 (isPrefixOf!0 (_2!5897 lt!200763) (_2!5897 lt!201239)))))

(declare-fun b!130387 () Bool)

(declare-fun e!86402 () Bool)

(assert (=> b!130387 (= e!86403 e!86402)))

(declare-fun res!108070 () Bool)

(assert (=> b!130387 (=> (not res!108070) (not e!86402))))

(declare-fun lt!201243 () tuple2!11198)

(declare-fun lt!201241 () tuple2!11204)

(assert (=> b!130387 (= res!108070 (and (= (size!2730 (_2!5899 lt!201241)) (size!2730 arr!237)) (= (_1!5899 lt!201241) (_2!5896 lt!201243))))))

(assert (=> b!130387 (= lt!201241 (readByteArrayLoopPure!0 (_1!5896 lt!201243) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!201245 () Unit!8065)

(declare-fun lt!201237 () Unit!8065)

(assert (=> b!130387 (= lt!201245 lt!201237)))

(assert (=> b!130387 (validate_offset_bits!1 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!201239)))) ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200763))) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200763))) lt!201244)))

(assert (=> b!130387 (= lt!201237 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5897 lt!200763) (buf!3088 (_2!5897 lt!201239)) lt!201244))))

(assert (=> b!130387 e!86404))

(declare-fun res!108068 () Bool)

(assert (=> b!130387 (=> (not res!108068) (not e!86404))))

(assert (=> b!130387 (= res!108068 (and (= (size!2730 (buf!3088 (_2!5897 lt!200763))) (size!2730 (buf!3088 (_2!5897 lt!201239)))) (bvsge lt!201244 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130387 (= lt!201244 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!130387 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!130387 (= lt!201243 (reader!0 (_2!5897 lt!200763) (_2!5897 lt!201239)))))

(declare-fun d!41616 () Bool)

(assert (=> d!41616 e!86403))

(declare-fun res!108071 () Bool)

(assert (=> d!41616 (=> (not res!108071) (not e!86403))))

(assert (=> d!41616 (= res!108071 (= (size!2730 (buf!3088 (_2!5897 lt!200763))) (size!2730 (buf!3088 (_2!5897 lt!201239)))))))

(declare-fun choose!64 (BitStream!4724 array!6029 (_ BitVec 32) (_ BitVec 32)) tuple2!11200)

(assert (=> d!41616 (= lt!201239 (choose!64 (_2!5897 lt!200763) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41616 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2730 arr!237)))))

(assert (=> d!41616 (= (appendByteArrayLoop!0 (_2!5897 lt!200763) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!201239)))

(declare-fun b!130388 () Bool)

(assert (=> b!130388 (= e!86402 (arrayRangesEq!133 arr!237 (_2!5899 lt!201241) #b00000000000000000000000000000000 to!404))))

(declare-fun b!130389 () Bool)

(declare-fun res!108069 () Bool)

(assert (=> b!130389 (=> (not res!108069) (not e!86403))))

(declare-fun lt!201240 () (_ BitVec 64))

(declare-fun lt!201238 () (_ BitVec 64))

(assert (=> b!130389 (= res!108069 (= (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!201239))) (currentByte!5849 (_2!5897 lt!201239)) (currentBit!5844 (_2!5897 lt!201239))) (bvadd lt!201240 lt!201238)))))

(assert (=> b!130389 (or (not (= (bvand lt!201240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201238 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!201240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!201240 lt!201238) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!201242 () (_ BitVec 64))

(assert (=> b!130389 (= lt!201238 (bvmul lt!201242 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!130389 (or (= lt!201242 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!201242 #b0000000000000000000000000000000000000000000000000000000000001000) lt!201242)))))

(assert (=> b!130389 (= lt!201242 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!130389 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!130389 (= lt!201240 (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200763))) (currentByte!5849 (_2!5897 lt!200763)) (currentBit!5844 (_2!5897 lt!200763))))))

(assert (= (and d!41616 res!108071) b!130389))

(assert (= (and b!130389 res!108069) b!130386))

(assert (= (and b!130386 res!108067) b!130387))

(assert (= (and b!130387 res!108068) b!130385))

(assert (= (and b!130387 res!108070) b!130388))

(declare-fun m!196653 () Bool)

(assert (=> b!130388 m!196653))

(declare-fun m!196655 () Bool)

(assert (=> b!130385 m!196655))

(declare-fun m!196657 () Bool)

(assert (=> b!130386 m!196657))

(declare-fun m!196659 () Bool)

(assert (=> b!130389 m!196659))

(assert (=> b!130389 m!196287))

(declare-fun m!196661 () Bool)

(assert (=> b!130387 m!196661))

(declare-fun m!196663 () Bool)

(assert (=> b!130387 m!196663))

(declare-fun m!196665 () Bool)

(assert (=> b!130387 m!196665))

(declare-fun m!196667 () Bool)

(assert (=> b!130387 m!196667))

(declare-fun m!196669 () Bool)

(assert (=> d!41616 m!196669))

(assert (=> b!130189 d!41616))

(declare-fun d!41638 () Bool)

(declare-fun e!86407 () Bool)

(assert (=> d!41638 e!86407))

(declare-fun res!108074 () Bool)

(assert (=> d!41638 (=> (not res!108074) (not e!86407))))

(declare-fun lt!201257 () tuple2!11202)

(declare-fun lt!201254 () tuple2!11202)

(assert (=> d!41638 (= res!108074 (= (bitIndex!0 (size!2730 (buf!3088 (_1!5898 lt!201257))) (currentByte!5849 (_1!5898 lt!201257)) (currentBit!5844 (_1!5898 lt!201257))) (bitIndex!0 (size!2730 (buf!3088 (_1!5898 lt!201254))) (currentByte!5849 (_1!5898 lt!201254)) (currentBit!5844 (_1!5898 lt!201254)))))))

(declare-fun lt!201256 () Unit!8065)

(declare-fun lt!201255 () BitStream!4724)

(declare-fun choose!14 (BitStream!4724 BitStream!4724 BitStream!4724 tuple2!11202 tuple2!11202 BitStream!4724 (_ BitVec 8) tuple2!11202 tuple2!11202 BitStream!4724 (_ BitVec 8)) Unit!8065)

(assert (=> d!41638 (= lt!201256 (choose!14 lt!200758 (_2!5897 lt!200770) lt!201255 lt!201257 (tuple2!11203 (_1!5898 lt!201257) (_2!5898 lt!201257)) (_1!5898 lt!201257) (_2!5898 lt!201257) lt!201254 (tuple2!11203 (_1!5898 lt!201254) (_2!5898 lt!201254)) (_1!5898 lt!201254) (_2!5898 lt!201254)))))

(assert (=> d!41638 (= lt!201254 (readBytePure!0 lt!201255))))

(assert (=> d!41638 (= lt!201257 (readBytePure!0 lt!200758))))

(assert (=> d!41638 (= lt!201255 (BitStream!4725 (buf!3088 (_2!5897 lt!200770)) (currentByte!5849 lt!200758) (currentBit!5844 lt!200758)))))

(assert (=> d!41638 (= (readBytePrefixLemma!0 lt!200758 (_2!5897 lt!200770)) lt!201256)))

(declare-fun b!130392 () Bool)

(assert (=> b!130392 (= e!86407 (= (_2!5898 lt!201257) (_2!5898 lt!201254)))))

(assert (= (and d!41638 res!108074) b!130392))

(declare-fun m!196671 () Bool)

(assert (=> d!41638 m!196671))

(declare-fun m!196673 () Bool)

(assert (=> d!41638 m!196673))

(declare-fun m!196675 () Bool)

(assert (=> d!41638 m!196675))

(assert (=> d!41638 m!196309))

(declare-fun m!196677 () Bool)

(assert (=> d!41638 m!196677))

(assert (=> b!130189 d!41638))

(declare-fun d!41640 () Bool)

(declare-fun e!86410 () Bool)

(assert (=> d!41640 e!86410))

(declare-fun res!108079 () Bool)

(assert (=> d!41640 (=> (not res!108079) (not e!86410))))

(declare-fun lt!201274 () (_ BitVec 64))

(declare-fun lt!201272 () (_ BitVec 64))

(declare-fun lt!201271 () (_ BitVec 64))

(assert (=> d!41640 (= res!108079 (= lt!201272 (bvsub lt!201271 lt!201274)))))

(assert (=> d!41640 (or (= (bvand lt!201271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201274 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!201271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!201271 lt!201274) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41640 (= lt!201274 (remainingBits!0 ((_ sign_extend 32) (size!2730 (buf!3088 (_1!5898 lt!200757)))) ((_ sign_extend 32) (currentByte!5849 (_1!5898 lt!200757))) ((_ sign_extend 32) (currentBit!5844 (_1!5898 lt!200757)))))))

(declare-fun lt!201273 () (_ BitVec 64))

(declare-fun lt!201275 () (_ BitVec 64))

(assert (=> d!41640 (= lt!201271 (bvmul lt!201273 lt!201275))))

(assert (=> d!41640 (or (= lt!201273 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!201275 (bvsdiv (bvmul lt!201273 lt!201275) lt!201273)))))

(assert (=> d!41640 (= lt!201275 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41640 (= lt!201273 ((_ sign_extend 32) (size!2730 (buf!3088 (_1!5898 lt!200757)))))))

(assert (=> d!41640 (= lt!201272 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5849 (_1!5898 lt!200757))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5844 (_1!5898 lt!200757)))))))

(assert (=> d!41640 (invariant!0 (currentBit!5844 (_1!5898 lt!200757)) (currentByte!5849 (_1!5898 lt!200757)) (size!2730 (buf!3088 (_1!5898 lt!200757))))))

(assert (=> d!41640 (= (bitIndex!0 (size!2730 (buf!3088 (_1!5898 lt!200757))) (currentByte!5849 (_1!5898 lt!200757)) (currentBit!5844 (_1!5898 lt!200757))) lt!201272)))

(declare-fun b!130397 () Bool)

(declare-fun res!108080 () Bool)

(assert (=> b!130397 (=> (not res!108080) (not e!86410))))

(assert (=> b!130397 (= res!108080 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!201272))))

(declare-fun b!130398 () Bool)

(declare-fun lt!201270 () (_ BitVec 64))

(assert (=> b!130398 (= e!86410 (bvsle lt!201272 (bvmul lt!201270 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130398 (or (= lt!201270 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!201270 #b0000000000000000000000000000000000000000000000000000000000001000) lt!201270)))))

(assert (=> b!130398 (= lt!201270 ((_ sign_extend 32) (size!2730 (buf!3088 (_1!5898 lt!200757)))))))

(assert (= (and d!41640 res!108079) b!130397))

(assert (= (and b!130397 res!108080) b!130398))

(declare-fun m!196679 () Bool)

(assert (=> d!41640 m!196679))

(declare-fun m!196681 () Bool)

(assert (=> d!41640 m!196681))

(assert (=> b!130189 d!41640))

(declare-fun b!130399 () Bool)

(declare-fun res!108081 () Bool)

(declare-fun e!86412 () Bool)

(assert (=> b!130399 (=> (not res!108081) (not e!86412))))

(declare-fun lt!201280 () tuple2!11198)

(assert (=> b!130399 (= res!108081 (isPrefixOf!0 (_2!5896 lt!201280) (_2!5897 lt!200770)))))

(declare-fun d!41642 () Bool)

(assert (=> d!41642 e!86412))

(declare-fun res!108083 () Bool)

(assert (=> d!41642 (=> (not res!108083) (not e!86412))))

(assert (=> d!41642 (= res!108083 (isPrefixOf!0 (_1!5896 lt!201280) (_2!5896 lt!201280)))))

(declare-fun lt!201295 () BitStream!4724)

(assert (=> d!41642 (= lt!201280 (tuple2!11199 lt!201295 (_2!5897 lt!200770)))))

(declare-fun lt!201293 () Unit!8065)

(declare-fun lt!201279 () Unit!8065)

(assert (=> d!41642 (= lt!201293 lt!201279)))

(assert (=> d!41642 (isPrefixOf!0 lt!201295 (_2!5897 lt!200770))))

(assert (=> d!41642 (= lt!201279 (lemmaIsPrefixTransitive!0 lt!201295 (_2!5897 lt!200770) (_2!5897 lt!200770)))))

(declare-fun lt!201294 () Unit!8065)

(declare-fun lt!201287 () Unit!8065)

(assert (=> d!41642 (= lt!201294 lt!201287)))

(assert (=> d!41642 (isPrefixOf!0 lt!201295 (_2!5897 lt!200770))))

(assert (=> d!41642 (= lt!201287 (lemmaIsPrefixTransitive!0 lt!201295 (_2!5897 lt!200763) (_2!5897 lt!200770)))))

(declare-fun lt!201276 () Unit!8065)

(declare-fun e!86411 () Unit!8065)

(assert (=> d!41642 (= lt!201276 e!86411)))

(declare-fun c!7552 () Bool)

(assert (=> d!41642 (= c!7552 (not (= (size!2730 (buf!3088 (_2!5897 lt!200763))) #b00000000000000000000000000000000)))))

(declare-fun lt!201285 () Unit!8065)

(declare-fun lt!201291 () Unit!8065)

(assert (=> d!41642 (= lt!201285 lt!201291)))

(assert (=> d!41642 (isPrefixOf!0 (_2!5897 lt!200770) (_2!5897 lt!200770))))

(assert (=> d!41642 (= lt!201291 (lemmaIsPrefixRefl!0 (_2!5897 lt!200770)))))

(declare-fun lt!201283 () Unit!8065)

(declare-fun lt!201288 () Unit!8065)

(assert (=> d!41642 (= lt!201283 lt!201288)))

(assert (=> d!41642 (= lt!201288 (lemmaIsPrefixRefl!0 (_2!5897 lt!200770)))))

(declare-fun lt!201284 () Unit!8065)

(declare-fun lt!201289 () Unit!8065)

(assert (=> d!41642 (= lt!201284 lt!201289)))

(assert (=> d!41642 (isPrefixOf!0 lt!201295 lt!201295)))

(assert (=> d!41642 (= lt!201289 (lemmaIsPrefixRefl!0 lt!201295))))

(declare-fun lt!201281 () Unit!8065)

(declare-fun lt!201286 () Unit!8065)

(assert (=> d!41642 (= lt!201281 lt!201286)))

(assert (=> d!41642 (isPrefixOf!0 (_2!5897 lt!200763) (_2!5897 lt!200763))))

(assert (=> d!41642 (= lt!201286 (lemmaIsPrefixRefl!0 (_2!5897 lt!200763)))))

(assert (=> d!41642 (= lt!201295 (BitStream!4725 (buf!3088 (_2!5897 lt!200770)) (currentByte!5849 (_2!5897 lt!200763)) (currentBit!5844 (_2!5897 lt!200763))))))

(assert (=> d!41642 (isPrefixOf!0 (_2!5897 lt!200763) (_2!5897 lt!200770))))

(assert (=> d!41642 (= (reader!0 (_2!5897 lt!200763) (_2!5897 lt!200770)) lt!201280)))

(declare-fun b!130400 () Bool)

(declare-fun res!108082 () Bool)

(assert (=> b!130400 (=> (not res!108082) (not e!86412))))

(assert (=> b!130400 (= res!108082 (isPrefixOf!0 (_1!5896 lt!201280) (_2!5897 lt!200763)))))

(declare-fun b!130401 () Bool)

(declare-fun lt!201278 () Unit!8065)

(assert (=> b!130401 (= e!86411 lt!201278)))

(declare-fun lt!201290 () (_ BitVec 64))

(assert (=> b!130401 (= lt!201290 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!201277 () (_ BitVec 64))

(assert (=> b!130401 (= lt!201277 (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200763))) (currentByte!5849 (_2!5897 lt!200763)) (currentBit!5844 (_2!5897 lt!200763))))))

(assert (=> b!130401 (= lt!201278 (arrayBitRangesEqSymmetric!0 (buf!3088 (_2!5897 lt!200763)) (buf!3088 (_2!5897 lt!200770)) lt!201290 lt!201277))))

(assert (=> b!130401 (arrayBitRangesEq!0 (buf!3088 (_2!5897 lt!200770)) (buf!3088 (_2!5897 lt!200763)) lt!201290 lt!201277)))

(declare-fun lt!201292 () (_ BitVec 64))

(declare-fun b!130402 () Bool)

(declare-fun lt!201282 () (_ BitVec 64))

(assert (=> b!130402 (= e!86412 (= (_1!5896 lt!201280) (withMovedBitIndex!0 (_2!5896 lt!201280) (bvsub lt!201282 lt!201292))))))

(assert (=> b!130402 (or (= (bvand lt!201282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201292 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!201282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!201282 lt!201292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130402 (= lt!201292 (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200770))) (currentByte!5849 (_2!5897 lt!200770)) (currentBit!5844 (_2!5897 lt!200770))))))

(assert (=> b!130402 (= lt!201282 (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200763))) (currentByte!5849 (_2!5897 lt!200763)) (currentBit!5844 (_2!5897 lt!200763))))))

(declare-fun b!130403 () Bool)

(declare-fun Unit!8071 () Unit!8065)

(assert (=> b!130403 (= e!86411 Unit!8071)))

(assert (= (and d!41642 c!7552) b!130401))

(assert (= (and d!41642 (not c!7552)) b!130403))

(assert (= (and d!41642 res!108083) b!130400))

(assert (= (and b!130400 res!108082) b!130399))

(assert (= (and b!130399 res!108081) b!130402))

(declare-fun m!196683 () Bool)

(assert (=> b!130399 m!196683))

(declare-fun m!196685 () Bool)

(assert (=> b!130400 m!196685))

(assert (=> d!41642 m!196301))

(declare-fun m!196687 () Bool)

(assert (=> d!41642 m!196687))

(declare-fun m!196689 () Bool)

(assert (=> d!41642 m!196689))

(declare-fun m!196691 () Bool)

(assert (=> d!41642 m!196691))

(declare-fun m!196693 () Bool)

(assert (=> d!41642 m!196693))

(assert (=> d!41642 m!196523))

(declare-fun m!196695 () Bool)

(assert (=> d!41642 m!196695))

(declare-fun m!196697 () Bool)

(assert (=> d!41642 m!196697))

(declare-fun m!196699 () Bool)

(assert (=> d!41642 m!196699))

(assert (=> d!41642 m!196531))

(declare-fun m!196701 () Bool)

(assert (=> d!41642 m!196701))

(assert (=> b!130401 m!196287))

(declare-fun m!196703 () Bool)

(assert (=> b!130401 m!196703))

(declare-fun m!196705 () Bool)

(assert (=> b!130401 m!196705))

(declare-fun m!196707 () Bool)

(assert (=> b!130402 m!196707))

(assert (=> b!130402 m!196285))

(assert (=> b!130402 m!196287))

(assert (=> b!130189 d!41642))

(declare-fun d!41644 () Bool)

(assert (=> d!41644 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2730 (buf!3088 (_1!5896 lt!200759)))) ((_ sign_extend 32) (currentByte!5849 (_1!5896 lt!200759))) ((_ sign_extend 32) (currentBit!5844 (_1!5896 lt!200759)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2730 (buf!3088 (_1!5896 lt!200759)))) ((_ sign_extend 32) (currentByte!5849 (_1!5896 lt!200759))) ((_ sign_extend 32) (currentBit!5844 (_1!5896 lt!200759)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!10159 () Bool)

(assert (= bs!10159 d!41644))

(declare-fun m!196709 () Bool)

(assert (=> bs!10159 m!196709))

(assert (=> b!130189 d!41644))

(declare-fun d!41646 () Bool)

(declare-fun e!86415 () Bool)

(assert (=> d!41646 e!86415))

(declare-fun res!108092 () Bool)

(assert (=> d!41646 (=> (not res!108092) (not e!86415))))

(declare-fun lt!201310 () tuple2!11200)

(assert (=> d!41646 (= res!108092 (= (size!2730 (buf!3088 thiss!1634)) (size!2730 (buf!3088 (_2!5897 lt!201310)))))))

(declare-fun choose!6 (BitStream!4724 (_ BitVec 8)) tuple2!11200)

(assert (=> d!41646 (= lt!201310 (choose!6 thiss!1634 (select (arr!3347 arr!237) from!447)))))

(assert (=> d!41646 (validate_offset_byte!0 ((_ sign_extend 32) (size!2730 (buf!3088 thiss!1634))) ((_ sign_extend 32) (currentByte!5849 thiss!1634)) ((_ sign_extend 32) (currentBit!5844 thiss!1634)))))

(assert (=> d!41646 (= (appendByte!0 thiss!1634 (select (arr!3347 arr!237) from!447)) lt!201310)))

(declare-fun b!130410 () Bool)

(declare-fun res!108090 () Bool)

(assert (=> b!130410 (=> (not res!108090) (not e!86415))))

(declare-fun lt!201307 () (_ BitVec 64))

(declare-fun lt!201306 () (_ BitVec 64))

(assert (=> b!130410 (= res!108090 (= (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!201310))) (currentByte!5849 (_2!5897 lt!201310)) (currentBit!5844 (_2!5897 lt!201310))) (bvadd lt!201307 lt!201306)))))

(assert (=> b!130410 (or (not (= (bvand lt!201307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201306 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!201307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!201307 lt!201306) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130410 (= lt!201306 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!130410 (= lt!201307 (bitIndex!0 (size!2730 (buf!3088 thiss!1634)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634)))))

(declare-fun b!130411 () Bool)

(declare-fun res!108091 () Bool)

(assert (=> b!130411 (=> (not res!108091) (not e!86415))))

(assert (=> b!130411 (= res!108091 (isPrefixOf!0 thiss!1634 (_2!5897 lt!201310)))))

(declare-fun lt!201309 () tuple2!11202)

(declare-fun b!130412 () Bool)

(declare-fun lt!201308 () tuple2!11198)

(assert (=> b!130412 (= e!86415 (and (= (_2!5898 lt!201309) (select (arr!3347 arr!237) from!447)) (= (_1!5898 lt!201309) (_2!5896 lt!201308))))))

(assert (=> b!130412 (= lt!201309 (readBytePure!0 (_1!5896 lt!201308)))))

(assert (=> b!130412 (= lt!201308 (reader!0 thiss!1634 (_2!5897 lt!201310)))))

(assert (= (and d!41646 res!108092) b!130410))

(assert (= (and b!130410 res!108090) b!130411))

(assert (= (and b!130411 res!108091) b!130412))

(assert (=> d!41646 m!196275))

(declare-fun m!196711 () Bool)

(assert (=> d!41646 m!196711))

(declare-fun m!196713 () Bool)

(assert (=> d!41646 m!196713))

(declare-fun m!196715 () Bool)

(assert (=> b!130410 m!196715))

(assert (=> b!130410 m!196297))

(declare-fun m!196717 () Bool)

(assert (=> b!130411 m!196717))

(declare-fun m!196719 () Bool)

(assert (=> b!130412 m!196719))

(declare-fun m!196721 () Bool)

(assert (=> b!130412 m!196721))

(assert (=> b!130189 d!41646))

(declare-fun d!41648 () Bool)

(declare-fun e!86416 () Bool)

(assert (=> d!41648 e!86416))

(declare-fun res!108093 () Bool)

(assert (=> d!41648 (=> (not res!108093) (not e!86416))))

(declare-fun lt!201315 () (_ BitVec 64))

(declare-fun lt!201312 () (_ BitVec 64))

(declare-fun lt!201313 () (_ BitVec 64))

(assert (=> d!41648 (= res!108093 (= lt!201313 (bvsub lt!201312 lt!201315)))))

(assert (=> d!41648 (or (= (bvand lt!201312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201315 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!201312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!201312 lt!201315) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41648 (= lt!201315 (remainingBits!0 ((_ sign_extend 32) (size!2730 (buf!3088 (_1!5898 lt!200766)))) ((_ sign_extend 32) (currentByte!5849 (_1!5898 lt!200766))) ((_ sign_extend 32) (currentBit!5844 (_1!5898 lt!200766)))))))

(declare-fun lt!201314 () (_ BitVec 64))

(declare-fun lt!201316 () (_ BitVec 64))

(assert (=> d!41648 (= lt!201312 (bvmul lt!201314 lt!201316))))

(assert (=> d!41648 (or (= lt!201314 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!201316 (bvsdiv (bvmul lt!201314 lt!201316) lt!201314)))))

(assert (=> d!41648 (= lt!201316 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41648 (= lt!201314 ((_ sign_extend 32) (size!2730 (buf!3088 (_1!5898 lt!200766)))))))

(assert (=> d!41648 (= lt!201313 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5849 (_1!5898 lt!200766))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5844 (_1!5898 lt!200766)))))))

(assert (=> d!41648 (invariant!0 (currentBit!5844 (_1!5898 lt!200766)) (currentByte!5849 (_1!5898 lt!200766)) (size!2730 (buf!3088 (_1!5898 lt!200766))))))

(assert (=> d!41648 (= (bitIndex!0 (size!2730 (buf!3088 (_1!5898 lt!200766))) (currentByte!5849 (_1!5898 lt!200766)) (currentBit!5844 (_1!5898 lt!200766))) lt!201313)))

(declare-fun b!130413 () Bool)

(declare-fun res!108094 () Bool)

(assert (=> b!130413 (=> (not res!108094) (not e!86416))))

(assert (=> b!130413 (= res!108094 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!201313))))

(declare-fun b!130414 () Bool)

(declare-fun lt!201311 () (_ BitVec 64))

(assert (=> b!130414 (= e!86416 (bvsle lt!201313 (bvmul lt!201311 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130414 (or (= lt!201311 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!201311 #b0000000000000000000000000000000000000000000000000000000000001000) lt!201311)))))

(assert (=> b!130414 (= lt!201311 ((_ sign_extend 32) (size!2730 (buf!3088 (_1!5898 lt!200766)))))))

(assert (= (and d!41648 res!108093) b!130413))

(assert (= (and b!130413 res!108094) b!130414))

(declare-fun m!196723 () Bool)

(assert (=> d!41648 m!196723))

(declare-fun m!196725 () Bool)

(assert (=> d!41648 m!196725))

(assert (=> b!130189 d!41648))

(declare-fun d!41650 () Bool)

(declare-fun res!108111 () Bool)

(declare-fun e!86427 () Bool)

(assert (=> d!41650 (=> (not res!108111) (not e!86427))))

(assert (=> d!41650 (= res!108111 (= (size!2730 (buf!3088 thiss!1634)) (size!2730 (buf!3088 (_2!5897 lt!200770)))))))

(assert (=> d!41650 (= (isPrefixOf!0 thiss!1634 (_2!5897 lt!200770)) e!86427)))

(declare-fun b!130431 () Bool)

(declare-fun res!108112 () Bool)

(assert (=> b!130431 (=> (not res!108112) (not e!86427))))

(assert (=> b!130431 (= res!108112 (bvsle (bitIndex!0 (size!2730 (buf!3088 thiss!1634)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634)) (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200770))) (currentByte!5849 (_2!5897 lt!200770)) (currentBit!5844 (_2!5897 lt!200770)))))))

(declare-fun b!130432 () Bool)

(declare-fun e!86428 () Bool)

(assert (=> b!130432 (= e!86427 e!86428)))

(declare-fun res!108113 () Bool)

(assert (=> b!130432 (=> res!108113 e!86428)))

(assert (=> b!130432 (= res!108113 (= (size!2730 (buf!3088 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!130433 () Bool)

(assert (=> b!130433 (= e!86428 (arrayBitRangesEq!0 (buf!3088 thiss!1634) (buf!3088 (_2!5897 lt!200770)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2730 (buf!3088 thiss!1634)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634))))))

(assert (= (and d!41650 res!108111) b!130431))

(assert (= (and b!130431 res!108112) b!130432))

(assert (= (and b!130432 (not res!108113)) b!130433))

(assert (=> b!130431 m!196297))

(assert (=> b!130431 m!196285))

(assert (=> b!130433 m!196297))

(assert (=> b!130433 m!196297))

(declare-fun m!196727 () Bool)

(assert (=> b!130433 m!196727))

(assert (=> b!130189 d!41650))

(declare-fun d!41652 () Bool)

(assert (=> d!41652 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200763)))) ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200763))) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200763))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200763)))) ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200763))) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200763)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10160 () Bool)

(assert (= bs!10160 d!41652))

(declare-fun m!196729 () Bool)

(assert (=> bs!10160 m!196729))

(assert (=> b!130189 d!41652))

(declare-fun d!41654 () Bool)

(declare-datatypes ((tuple2!11210 0))(
  ( (tuple2!11211 (_1!5903 (_ BitVec 8)) (_2!5903 BitStream!4724)) )
))
(declare-fun lt!201337 () tuple2!11210)

(declare-fun readByte!0 (BitStream!4724) tuple2!11210)

(assert (=> d!41654 (= lt!201337 (readByte!0 (BitStream!4725 (buf!3088 (_2!5897 lt!200770)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634))))))

(assert (=> d!41654 (= (readBytePure!0 (BitStream!4725 (buf!3088 (_2!5897 lt!200770)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634))) (tuple2!11203 (_2!5903 lt!201337) (_1!5903 lt!201337)))))

(declare-fun bs!10161 () Bool)

(assert (= bs!10161 d!41654))

(declare-fun m!196731 () Bool)

(assert (=> bs!10161 m!196731))

(assert (=> b!130189 d!41654))

(declare-fun d!41656 () Bool)

(declare-fun e!86438 () Bool)

(assert (=> d!41656 e!86438))

(declare-fun res!108127 () Bool)

(assert (=> d!41656 (=> (not res!108127) (not e!86438))))

(assert (=> d!41656 (= res!108127 (and (or (let ((rhs!3076 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3076 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3076) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!41659 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!41659 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!41659 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3075 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3075 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3075) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!201376 () Unit!8065)

(declare-fun choose!57 (BitStream!4724 BitStream!4724 (_ BitVec 64) (_ BitVec 32)) Unit!8065)

(assert (=> d!41656 (= lt!201376 (choose!57 thiss!1634 (_2!5897 lt!200763) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!41656 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5897 lt!200763) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!201376)))

(declare-fun b!130449 () Bool)

(declare-fun lt!201375 () (_ BitVec 32))

(assert (=> b!130449 (= e!86438 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200763)))) ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200763))) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200763))) (bvsub (bvsub to!404 from!447) lt!201375)))))

(assert (=> b!130449 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!201375 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!201375) #b10000000000000000000000000000000)))))

(declare-fun lt!201374 () (_ BitVec 64))

(assert (=> b!130449 (= lt!201375 ((_ extract 31 0) lt!201374))))

(assert (=> b!130449 (and (bvslt lt!201374 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!201374 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!130449 (= lt!201374 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!41656 res!108127) b!130449))

(declare-fun m!196777 () Bool)

(assert (=> d!41656 m!196777))

(declare-fun m!196779 () Bool)

(assert (=> b!130449 m!196779))

(assert (=> b!130189 d!41656))

(declare-fun d!41667 () Bool)

(declare-fun lt!201377 () tuple2!11210)

(assert (=> d!41667 (= lt!201377 (readByte!0 lt!200758))))

(assert (=> d!41667 (= (readBytePure!0 lt!200758) (tuple2!11203 (_2!5903 lt!201377) (_1!5903 lt!201377)))))

(declare-fun bs!10163 () Bool)

(assert (= bs!10163 d!41667))

(declare-fun m!196781 () Bool)

(assert (=> bs!10163 m!196781))

(assert (=> b!130189 d!41667))

(declare-fun d!41669 () Bool)

(declare-fun lt!201378 () tuple2!11210)

(assert (=> d!41669 (= lt!201378 (readByte!0 (_1!5896 lt!200768)))))

(assert (=> d!41669 (= (readBytePure!0 (_1!5896 lt!200768)) (tuple2!11203 (_2!5903 lt!201378) (_1!5903 lt!201378)))))

(declare-fun bs!10164 () Bool)

(assert (= bs!10164 d!41669))

(declare-fun m!196783 () Bool)

(assert (=> bs!10164 m!196783))

(assert (=> b!130190 d!41669))

(declare-fun b!130450 () Bool)

(declare-fun res!108128 () Bool)

(declare-fun e!86440 () Bool)

(assert (=> b!130450 (=> (not res!108128) (not e!86440))))

(declare-fun lt!201383 () tuple2!11198)

(assert (=> b!130450 (= res!108128 (isPrefixOf!0 (_2!5896 lt!201383) (_2!5897 lt!200763)))))

(declare-fun d!41671 () Bool)

(assert (=> d!41671 e!86440))

(declare-fun res!108130 () Bool)

(assert (=> d!41671 (=> (not res!108130) (not e!86440))))

(assert (=> d!41671 (= res!108130 (isPrefixOf!0 (_1!5896 lt!201383) (_2!5896 lt!201383)))))

(declare-fun lt!201398 () BitStream!4724)

(assert (=> d!41671 (= lt!201383 (tuple2!11199 lt!201398 (_2!5897 lt!200763)))))

(declare-fun lt!201396 () Unit!8065)

(declare-fun lt!201382 () Unit!8065)

(assert (=> d!41671 (= lt!201396 lt!201382)))

(assert (=> d!41671 (isPrefixOf!0 lt!201398 (_2!5897 lt!200763))))

(assert (=> d!41671 (= lt!201382 (lemmaIsPrefixTransitive!0 lt!201398 (_2!5897 lt!200763) (_2!5897 lt!200763)))))

(declare-fun lt!201397 () Unit!8065)

(declare-fun lt!201390 () Unit!8065)

(assert (=> d!41671 (= lt!201397 lt!201390)))

(assert (=> d!41671 (isPrefixOf!0 lt!201398 (_2!5897 lt!200763))))

(assert (=> d!41671 (= lt!201390 (lemmaIsPrefixTransitive!0 lt!201398 thiss!1634 (_2!5897 lt!200763)))))

(declare-fun lt!201379 () Unit!8065)

(declare-fun e!86439 () Unit!8065)

(assert (=> d!41671 (= lt!201379 e!86439)))

(declare-fun c!7554 () Bool)

(assert (=> d!41671 (= c!7554 (not (= (size!2730 (buf!3088 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!201388 () Unit!8065)

(declare-fun lt!201394 () Unit!8065)

(assert (=> d!41671 (= lt!201388 lt!201394)))

(assert (=> d!41671 (isPrefixOf!0 (_2!5897 lt!200763) (_2!5897 lt!200763))))

(assert (=> d!41671 (= lt!201394 (lemmaIsPrefixRefl!0 (_2!5897 lt!200763)))))

(declare-fun lt!201386 () Unit!8065)

(declare-fun lt!201391 () Unit!8065)

(assert (=> d!41671 (= lt!201386 lt!201391)))

(assert (=> d!41671 (= lt!201391 (lemmaIsPrefixRefl!0 (_2!5897 lt!200763)))))

(declare-fun lt!201387 () Unit!8065)

(declare-fun lt!201392 () Unit!8065)

(assert (=> d!41671 (= lt!201387 lt!201392)))

(assert (=> d!41671 (isPrefixOf!0 lt!201398 lt!201398)))

(assert (=> d!41671 (= lt!201392 (lemmaIsPrefixRefl!0 lt!201398))))

(declare-fun lt!201384 () Unit!8065)

(declare-fun lt!201389 () Unit!8065)

(assert (=> d!41671 (= lt!201384 lt!201389)))

(assert (=> d!41671 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41671 (= lt!201389 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41671 (= lt!201398 (BitStream!4725 (buf!3088 (_2!5897 lt!200763)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634)))))

(assert (=> d!41671 (isPrefixOf!0 thiss!1634 (_2!5897 lt!200763))))

(assert (=> d!41671 (= (reader!0 thiss!1634 (_2!5897 lt!200763)) lt!201383)))

(declare-fun b!130451 () Bool)

(declare-fun res!108129 () Bool)

(assert (=> b!130451 (=> (not res!108129) (not e!86440))))

(assert (=> b!130451 (= res!108129 (isPrefixOf!0 (_1!5896 lt!201383) thiss!1634))))

(declare-fun b!130452 () Bool)

(declare-fun lt!201381 () Unit!8065)

(assert (=> b!130452 (= e!86439 lt!201381)))

(declare-fun lt!201393 () (_ BitVec 64))

(assert (=> b!130452 (= lt!201393 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!201380 () (_ BitVec 64))

(assert (=> b!130452 (= lt!201380 (bitIndex!0 (size!2730 (buf!3088 thiss!1634)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634)))))

(assert (=> b!130452 (= lt!201381 (arrayBitRangesEqSymmetric!0 (buf!3088 thiss!1634) (buf!3088 (_2!5897 lt!200763)) lt!201393 lt!201380))))

(assert (=> b!130452 (arrayBitRangesEq!0 (buf!3088 (_2!5897 lt!200763)) (buf!3088 thiss!1634) lt!201393 lt!201380)))

(declare-fun b!130453 () Bool)

(declare-fun lt!201395 () (_ BitVec 64))

(declare-fun lt!201385 () (_ BitVec 64))

(assert (=> b!130453 (= e!86440 (= (_1!5896 lt!201383) (withMovedBitIndex!0 (_2!5896 lt!201383) (bvsub lt!201385 lt!201395))))))

(assert (=> b!130453 (or (= (bvand lt!201385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201395 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!201385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!201385 lt!201395) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130453 (= lt!201395 (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200763))) (currentByte!5849 (_2!5897 lt!200763)) (currentBit!5844 (_2!5897 lt!200763))))))

(assert (=> b!130453 (= lt!201385 (bitIndex!0 (size!2730 (buf!3088 thiss!1634)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634)))))

(declare-fun b!130454 () Bool)

(declare-fun Unit!8074 () Unit!8065)

(assert (=> b!130454 (= e!86439 Unit!8074)))

(assert (= (and d!41671 c!7554) b!130452))

(assert (= (and d!41671 (not c!7554)) b!130454))

(assert (= (and d!41671 res!108130) b!130451))

(assert (= (and b!130451 res!108129) b!130450))

(assert (= (and b!130450 res!108128) b!130453))

(declare-fun m!196785 () Bool)

(assert (=> b!130450 m!196785))

(declare-fun m!196787 () Bool)

(assert (=> b!130451 m!196787))

(assert (=> d!41671 m!196303))

(declare-fun m!196789 () Bool)

(assert (=> d!41671 m!196789))

(declare-fun m!196791 () Bool)

(assert (=> d!41671 m!196791))

(declare-fun m!196793 () Bool)

(assert (=> d!41671 m!196793))

(assert (=> d!41671 m!196521))

(assert (=> d!41671 m!196693))

(assert (=> d!41671 m!196525))

(declare-fun m!196795 () Bool)

(assert (=> d!41671 m!196795))

(declare-fun m!196797 () Bool)

(assert (=> d!41671 m!196797))

(assert (=> d!41671 m!196695))

(declare-fun m!196799 () Bool)

(assert (=> d!41671 m!196799))

(assert (=> b!130452 m!196297))

(declare-fun m!196801 () Bool)

(assert (=> b!130452 m!196801))

(declare-fun m!196803 () Bool)

(assert (=> b!130452 m!196803))

(declare-fun m!196805 () Bool)

(assert (=> b!130453 m!196805))

(assert (=> b!130453 m!196287))

(assert (=> b!130453 m!196297))

(assert (=> b!130190 d!41671))

(declare-fun d!41673 () Bool)

(assert (=> d!41673 (= (invariant!0 (currentBit!5844 thiss!1634) (currentByte!5849 thiss!1634) (size!2730 (buf!3088 (_2!5897 lt!200763)))) (and (bvsge (currentBit!5844 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5844 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5849 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5849 thiss!1634) (size!2730 (buf!3088 (_2!5897 lt!200763)))) (and (= (currentBit!5844 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5849 thiss!1634) (size!2730 (buf!3088 (_2!5897 lt!200763))))))))))

(assert (=> b!130201 d!41673))

(declare-datatypes ((tuple3!486 0))(
  ( (tuple3!487 (_1!5904 Unit!8065) (_2!5904 BitStream!4724) (_3!298 array!6029)) )
))
(declare-fun lt!201407 () tuple3!486)

(declare-fun d!41677 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4724 array!6029 (_ BitVec 32) (_ BitVec 32)) tuple3!486)

(assert (=> d!41677 (= lt!201407 (readByteArrayLoop!0 (_1!5896 lt!200760) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41677 (= (readByteArrayLoopPure!0 (_1!5896 lt!200760) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11205 (_2!5904 lt!201407) (_3!298 lt!201407)))))

(declare-fun bs!10168 () Bool)

(assert (= bs!10168 d!41677))

(declare-fun m!196813 () Bool)

(assert (=> bs!10168 m!196813))

(assert (=> b!130192 d!41677))

(declare-fun d!41683 () Bool)

(assert (=> d!41683 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200770)))) ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200763))) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200763))) lt!200762) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200770)))) ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200763))) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200763)))) lt!200762))))

(declare-fun bs!10169 () Bool)

(assert (= bs!10169 d!41683))

(declare-fun m!196821 () Bool)

(assert (=> bs!10169 m!196821))

(assert (=> b!130192 d!41683))

(declare-fun d!41685 () Bool)

(assert (=> d!41685 (validate_offset_bits!1 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200770)))) ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200763))) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200763))) lt!200762)))

(declare-fun lt!201410 () Unit!8065)

(declare-fun choose!9 (BitStream!4724 array!6029 (_ BitVec 64) BitStream!4724) Unit!8065)

(assert (=> d!41685 (= lt!201410 (choose!9 (_2!5897 lt!200763) (buf!3088 (_2!5897 lt!200770)) lt!200762 (BitStream!4725 (buf!3088 (_2!5897 lt!200770)) (currentByte!5849 (_2!5897 lt!200763)) (currentBit!5844 (_2!5897 lt!200763)))))))

(assert (=> d!41685 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5897 lt!200763) (buf!3088 (_2!5897 lt!200770)) lt!200762) lt!201410)))

(declare-fun bs!10170 () Bool)

(assert (= bs!10170 d!41685))

(assert (=> bs!10170 m!196291))

(declare-fun m!196823 () Bool)

(assert (=> bs!10170 m!196823))

(assert (=> b!130192 d!41685))

(assert (=> b!130192 d!41642))

(declare-fun d!41687 () Bool)

(declare-fun e!86447 () Bool)

(assert (=> d!41687 e!86447))

(declare-fun res!108137 () Bool)

(assert (=> d!41687 (=> (not res!108137) (not e!86447))))

(declare-fun lt!201412 () (_ BitVec 64))

(declare-fun lt!201413 () (_ BitVec 64))

(declare-fun lt!201415 () (_ BitVec 64))

(assert (=> d!41687 (= res!108137 (= lt!201413 (bvsub lt!201412 lt!201415)))))

(assert (=> d!41687 (or (= (bvand lt!201412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201415 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!201412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!201412 lt!201415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41687 (= lt!201415 (remainingBits!0 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200770)))) ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200770))) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200770)))))))

(declare-fun lt!201414 () (_ BitVec 64))

(declare-fun lt!201416 () (_ BitVec 64))

(assert (=> d!41687 (= lt!201412 (bvmul lt!201414 lt!201416))))

(assert (=> d!41687 (or (= lt!201414 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!201416 (bvsdiv (bvmul lt!201414 lt!201416) lt!201414)))))

(assert (=> d!41687 (= lt!201416 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41687 (= lt!201414 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200770)))))))

(assert (=> d!41687 (= lt!201413 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200770))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200770)))))))

(assert (=> d!41687 (invariant!0 (currentBit!5844 (_2!5897 lt!200770)) (currentByte!5849 (_2!5897 lt!200770)) (size!2730 (buf!3088 (_2!5897 lt!200770))))))

(assert (=> d!41687 (= (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200770))) (currentByte!5849 (_2!5897 lt!200770)) (currentBit!5844 (_2!5897 lt!200770))) lt!201413)))

(declare-fun b!130461 () Bool)

(declare-fun res!108138 () Bool)

(assert (=> b!130461 (=> (not res!108138) (not e!86447))))

(assert (=> b!130461 (= res!108138 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!201413))))

(declare-fun b!130462 () Bool)

(declare-fun lt!201411 () (_ BitVec 64))

(assert (=> b!130462 (= e!86447 (bvsle lt!201413 (bvmul lt!201411 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130462 (or (= lt!201411 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!201411 #b0000000000000000000000000000000000000000000000000000000000001000) lt!201411)))))

(assert (=> b!130462 (= lt!201411 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200770)))))))

(assert (= (and d!41687 res!108137) b!130461))

(assert (= (and b!130461 res!108138) b!130462))

(declare-fun m!196825 () Bool)

(assert (=> d!41687 m!196825))

(declare-fun m!196827 () Bool)

(assert (=> d!41687 m!196827))

(assert (=> b!130202 d!41687))

(declare-fun d!41689 () Bool)

(declare-fun e!86448 () Bool)

(assert (=> d!41689 e!86448))

(declare-fun res!108139 () Bool)

(assert (=> d!41689 (=> (not res!108139) (not e!86448))))

(declare-fun lt!201418 () (_ BitVec 64))

(declare-fun lt!201419 () (_ BitVec 64))

(declare-fun lt!201421 () (_ BitVec 64))

(assert (=> d!41689 (= res!108139 (= lt!201419 (bvsub lt!201418 lt!201421)))))

(assert (=> d!41689 (or (= (bvand lt!201418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201421 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!201418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!201418 lt!201421) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41689 (= lt!201421 (remainingBits!0 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200763)))) ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200763))) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200763)))))))

(declare-fun lt!201420 () (_ BitVec 64))

(declare-fun lt!201422 () (_ BitVec 64))

(assert (=> d!41689 (= lt!201418 (bvmul lt!201420 lt!201422))))

(assert (=> d!41689 (or (= lt!201420 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!201422 (bvsdiv (bvmul lt!201420 lt!201422) lt!201420)))))

(assert (=> d!41689 (= lt!201422 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41689 (= lt!201420 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200763)))))))

(assert (=> d!41689 (= lt!201419 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5849 (_2!5897 lt!200763))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5844 (_2!5897 lt!200763)))))))

(assert (=> d!41689 (invariant!0 (currentBit!5844 (_2!5897 lt!200763)) (currentByte!5849 (_2!5897 lt!200763)) (size!2730 (buf!3088 (_2!5897 lt!200763))))))

(assert (=> d!41689 (= (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200763))) (currentByte!5849 (_2!5897 lt!200763)) (currentBit!5844 (_2!5897 lt!200763))) lt!201419)))

(declare-fun b!130463 () Bool)

(declare-fun res!108140 () Bool)

(assert (=> b!130463 (=> (not res!108140) (not e!86448))))

(assert (=> b!130463 (= res!108140 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!201419))))

(declare-fun b!130464 () Bool)

(declare-fun lt!201417 () (_ BitVec 64))

(assert (=> b!130464 (= e!86448 (bvsle lt!201419 (bvmul lt!201417 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130464 (or (= lt!201417 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!201417 #b0000000000000000000000000000000000000000000000000000000000001000) lt!201417)))))

(assert (=> b!130464 (= lt!201417 ((_ sign_extend 32) (size!2730 (buf!3088 (_2!5897 lt!200763)))))))

(assert (= (and d!41689 res!108139) b!130463))

(assert (= (and b!130463 res!108140) b!130464))

(assert (=> d!41689 m!196729))

(declare-fun m!196829 () Bool)

(assert (=> d!41689 m!196829))

(assert (=> b!130202 d!41689))

(declare-fun d!41691 () Bool)

(assert (=> d!41691 (= (array_inv!2519 arr!237) (bvsge (size!2730 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25544 d!41691))

(declare-fun d!41693 () Bool)

(assert (=> d!41693 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5844 thiss!1634) (currentByte!5849 thiss!1634) (size!2730 (buf!3088 thiss!1634))))))

(declare-fun bs!10171 () Bool)

(assert (= bs!10171 d!41693))

(assert (=> bs!10171 m!196283))

(assert (=> start!25544 d!41693))

(declare-fun d!41695 () Bool)

(assert (=> d!41695 (= (invariant!0 (currentBit!5844 thiss!1634) (currentByte!5849 thiss!1634) (size!2730 (buf!3088 thiss!1634))) (and (bvsge (currentBit!5844 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5844 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5849 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5849 thiss!1634) (size!2730 (buf!3088 thiss!1634))) (and (= (currentBit!5844 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5849 thiss!1634) (size!2730 (buf!3088 thiss!1634)))))))))

(assert (=> b!130193 d!41695))

(declare-fun d!41697 () Bool)

(declare-fun res!108141 () Bool)

(declare-fun e!86449 () Bool)

(assert (=> d!41697 (=> (not res!108141) (not e!86449))))

(assert (=> d!41697 (= res!108141 (= (size!2730 (buf!3088 (_2!5897 lt!200763))) (size!2730 (buf!3088 (_2!5897 lt!200770)))))))

(assert (=> d!41697 (= (isPrefixOf!0 (_2!5897 lt!200763) (_2!5897 lt!200770)) e!86449)))

(declare-fun b!130465 () Bool)

(declare-fun res!108142 () Bool)

(assert (=> b!130465 (=> (not res!108142) (not e!86449))))

(assert (=> b!130465 (= res!108142 (bvsle (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200763))) (currentByte!5849 (_2!5897 lt!200763)) (currentBit!5844 (_2!5897 lt!200763))) (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200770))) (currentByte!5849 (_2!5897 lt!200770)) (currentBit!5844 (_2!5897 lt!200770)))))))

(declare-fun b!130466 () Bool)

(declare-fun e!86450 () Bool)

(assert (=> b!130466 (= e!86449 e!86450)))

(declare-fun res!108143 () Bool)

(assert (=> b!130466 (=> res!108143 e!86450)))

(assert (=> b!130466 (= res!108143 (= (size!2730 (buf!3088 (_2!5897 lt!200763))) #b00000000000000000000000000000000))))

(declare-fun b!130467 () Bool)

(assert (=> b!130467 (= e!86450 (arrayBitRangesEq!0 (buf!3088 (_2!5897 lt!200763)) (buf!3088 (_2!5897 lt!200770)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200763))) (currentByte!5849 (_2!5897 lt!200763)) (currentBit!5844 (_2!5897 lt!200763)))))))

(assert (= (and d!41697 res!108141) b!130465))

(assert (= (and b!130465 res!108142) b!130466))

(assert (= (and b!130466 (not res!108143)) b!130467))

(assert (=> b!130465 m!196287))

(assert (=> b!130465 m!196285))

(assert (=> b!130467 m!196287))

(assert (=> b!130467 m!196287))

(declare-fun m!196831 () Bool)

(assert (=> b!130467 m!196831))

(assert (=> b!130195 d!41697))

(declare-fun d!41699 () Bool)

(assert (=> d!41699 (= (array_inv!2519 (buf!3088 thiss!1634)) (bvsge (size!2730 (buf!3088 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!130194 d!41699))

(declare-fun d!41701 () Bool)

(declare-fun res!108144 () Bool)

(declare-fun e!86451 () Bool)

(assert (=> d!41701 (=> (not res!108144) (not e!86451))))

(assert (=> d!41701 (= res!108144 (= (size!2730 (buf!3088 thiss!1634)) (size!2730 (buf!3088 (_2!5897 lt!200763)))))))

(assert (=> d!41701 (= (isPrefixOf!0 thiss!1634 (_2!5897 lt!200763)) e!86451)))

(declare-fun b!130468 () Bool)

(declare-fun res!108145 () Bool)

(assert (=> b!130468 (=> (not res!108145) (not e!86451))))

(assert (=> b!130468 (= res!108145 (bvsle (bitIndex!0 (size!2730 (buf!3088 thiss!1634)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634)) (bitIndex!0 (size!2730 (buf!3088 (_2!5897 lt!200763))) (currentByte!5849 (_2!5897 lt!200763)) (currentBit!5844 (_2!5897 lt!200763)))))))

(declare-fun b!130469 () Bool)

(declare-fun e!86452 () Bool)

(assert (=> b!130469 (= e!86451 e!86452)))

(declare-fun res!108146 () Bool)

(assert (=> b!130469 (=> res!108146 e!86452)))

(assert (=> b!130469 (= res!108146 (= (size!2730 (buf!3088 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!130470 () Bool)

(assert (=> b!130470 (= e!86452 (arrayBitRangesEq!0 (buf!3088 thiss!1634) (buf!3088 (_2!5897 lt!200763)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2730 (buf!3088 thiss!1634)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634))))))

(assert (= (and d!41701 res!108144) b!130468))

(assert (= (and b!130468 res!108145) b!130469))

(assert (= (and b!130469 (not res!108146)) b!130470))

(assert (=> b!130468 m!196297))

(assert (=> b!130468 m!196287))

(assert (=> b!130470 m!196297))

(assert (=> b!130470 m!196297))

(declare-fun m!196833 () Bool)

(assert (=> b!130470 m!196833))

(assert (=> b!130196 d!41701))

(assert (=> b!130197 d!41689))

(declare-fun d!41703 () Bool)

(declare-fun e!86453 () Bool)

(assert (=> d!41703 e!86453))

(declare-fun res!108147 () Bool)

(assert (=> d!41703 (=> (not res!108147) (not e!86453))))

(declare-fun lt!201427 () (_ BitVec 64))

(declare-fun lt!201425 () (_ BitVec 64))

(declare-fun lt!201424 () (_ BitVec 64))

(assert (=> d!41703 (= res!108147 (= lt!201425 (bvsub lt!201424 lt!201427)))))

(assert (=> d!41703 (or (= (bvand lt!201424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201427 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!201424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!201424 lt!201427) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41703 (= lt!201427 (remainingBits!0 ((_ sign_extend 32) (size!2730 (buf!3088 thiss!1634))) ((_ sign_extend 32) (currentByte!5849 thiss!1634)) ((_ sign_extend 32) (currentBit!5844 thiss!1634))))))

(declare-fun lt!201426 () (_ BitVec 64))

(declare-fun lt!201428 () (_ BitVec 64))

(assert (=> d!41703 (= lt!201424 (bvmul lt!201426 lt!201428))))

(assert (=> d!41703 (or (= lt!201426 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!201428 (bvsdiv (bvmul lt!201426 lt!201428) lt!201426)))))

(assert (=> d!41703 (= lt!201428 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41703 (= lt!201426 ((_ sign_extend 32) (size!2730 (buf!3088 thiss!1634))))))

(assert (=> d!41703 (= lt!201425 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5849 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5844 thiss!1634))))))

(assert (=> d!41703 (invariant!0 (currentBit!5844 thiss!1634) (currentByte!5849 thiss!1634) (size!2730 (buf!3088 thiss!1634)))))

(assert (=> d!41703 (= (bitIndex!0 (size!2730 (buf!3088 thiss!1634)) (currentByte!5849 thiss!1634) (currentBit!5844 thiss!1634)) lt!201425)))

(declare-fun b!130471 () Bool)

(declare-fun res!108148 () Bool)

(assert (=> b!130471 (=> (not res!108148) (not e!86453))))

(assert (=> b!130471 (= res!108148 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!201425))))

(declare-fun b!130472 () Bool)

(declare-fun lt!201423 () (_ BitVec 64))

(assert (=> b!130472 (= e!86453 (bvsle lt!201425 (bvmul lt!201423 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130472 (or (= lt!201423 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!201423 #b0000000000000000000000000000000000000000000000000000000000001000) lt!201423)))))

(assert (=> b!130472 (= lt!201423 ((_ sign_extend 32) (size!2730 (buf!3088 thiss!1634))))))

(assert (= (and d!41703 res!108147) b!130471))

(assert (= (and b!130471 res!108148) b!130472))

(declare-fun m!196835 () Bool)

(assert (=> d!41703 m!196835))

(assert (=> d!41703 m!196283))

(assert (=> b!130197 d!41703))

(declare-fun d!41705 () Bool)

(assert (=> d!41705 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2730 (buf!3088 thiss!1634))) ((_ sign_extend 32) (currentByte!5849 thiss!1634)) ((_ sign_extend 32) (currentBit!5844 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2730 (buf!3088 thiss!1634))) ((_ sign_extend 32) (currentByte!5849 thiss!1634)) ((_ sign_extend 32) (currentBit!5844 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10172 () Bool)

(assert (= bs!10172 d!41705))

(assert (=> bs!10172 m!196835))

(assert (=> b!130199 d!41705))

(push 1)

(assert (not b!130431))

(assert (not d!41648))

(assert (not d!41685))

(assert (not b!130433))

(assert (not b!130467))

(assert (not d!41640))

(assert (not b!130451))

(assert (not d!41689))

(assert (not b!130402))

(assert (not b!130296))

(assert (not d!41654))

(assert (not d!41616))

(assert (not b!130452))

(assert (not d!41671))

(assert (not b!130453))

(assert (not b!130410))

(assert (not d!41646))

(assert (not b!130389))

(assert (not d!41669))

(assert (not b!130470))

(assert (not d!41642))

(assert (not b!130399))

(assert (not d!41687))

(assert (not d!41644))

(assert (not b!130400))

(assert (not d!41683))

(assert (not b!130333))

(assert (not b!130468))

(assert (not b!130386))

(assert (not b!130449))

(assert (not d!41638))

(assert (not d!41667))

(assert (not b!130450))

(assert (not b!130465))

(assert (not d!41705))

(assert (not d!41656))

(assert (not d!41592))

(assert (not d!41614))

(assert (not b!130331))

(assert (not b!130330))

(assert (not b!130387))

(assert (not d!41703))

(assert (not b!130401))

(assert (not b!130412))

(assert (not b!130332))

(assert (not b!130388))

(assert (not d!41693))

(assert (not d!41652))

(assert (not d!41677))

(assert (not b!130411))

(assert (not b!130385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

