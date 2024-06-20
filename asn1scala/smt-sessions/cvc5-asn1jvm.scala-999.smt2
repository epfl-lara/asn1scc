; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28016 () Bool)

(assert start!28016)

(declare-fun b!145160 () Bool)

(declare-fun e!96777 () Bool)

(declare-datatypes ((array!6608 0))(
  ( (array!6609 (arr!3725 (Array (_ BitVec 32) (_ BitVec 8))) (size!2992 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5242 0))(
  ( (BitStream!5243 (buf!3431 array!6608) (currentByte!6321 (_ BitVec 32)) (currentBit!6316 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5242)

(declare-fun array_inv!2781 (array!6608) Bool)

(assert (=> b!145160 (= e!96777 (array_inv!2781 (buf!3431 thiss!1634)))))

(declare-fun b!145161 () Bool)

(declare-fun e!96767 () Bool)

(declare-fun e!96768 () Bool)

(assert (=> b!145161 (= e!96767 (not e!96768))))

(declare-fun res!121354 () Bool)

(assert (=> b!145161 (=> res!121354 e!96768)))

(declare-fun arr!237 () array!6608)

(declare-datatypes ((tuple2!12978 0))(
  ( (tuple2!12979 (_1!6835 BitStream!5242) (_2!6835 BitStream!5242)) )
))
(declare-fun lt!224892 () tuple2!12978)

(declare-datatypes ((tuple2!12980 0))(
  ( (tuple2!12981 (_1!6836 BitStream!5242) (_2!6836 array!6608)) )
))
(declare-fun lt!224897 () tuple2!12980)

(assert (=> b!145161 (= res!121354 (or (not (= (size!2992 (_2!6836 lt!224897)) (size!2992 arr!237))) (not (= (_1!6836 lt!224897) (_2!6835 lt!224892)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5242 array!6608 (_ BitVec 32) (_ BitVec 32)) tuple2!12980)

(assert (=> b!145161 (= lt!224897 (readByteArrayLoopPure!0 (_1!6835 lt!224892) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!9057 0))(
  ( (Unit!9058) )
))
(declare-datatypes ((tuple2!12982 0))(
  ( (tuple2!12983 (_1!6837 Unit!9057) (_2!6837 BitStream!5242)) )
))
(declare-fun lt!224891 () tuple2!12982)

(declare-fun lt!224898 () tuple2!12982)

(declare-fun lt!224900 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145161 (validate_offset_bits!1 ((_ sign_extend 32) (size!2992 (buf!3431 (_2!6837 lt!224891)))) ((_ sign_extend 32) (currentByte!6321 (_2!6837 lt!224898))) ((_ sign_extend 32) (currentBit!6316 (_2!6837 lt!224898))) lt!224900)))

(declare-fun lt!224895 () Unit!9057)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5242 array!6608 (_ BitVec 64)) Unit!9057)

(assert (=> b!145161 (= lt!224895 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6837 lt!224898) (buf!3431 (_2!6837 lt!224891)) lt!224900))))

(declare-fun reader!0 (BitStream!5242 BitStream!5242) tuple2!12978)

(assert (=> b!145161 (= lt!224892 (reader!0 (_2!6837 lt!224898) (_2!6837 lt!224891)))))

(declare-fun b!145162 () Bool)

(declare-fun e!96776 () Bool)

(assert (=> b!145162 (= e!96776 (not (or (not (= (bvand from!447 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand from!447 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)))))))

(declare-fun lt!224888 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145162 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2992 (buf!3431 (_2!6837 lt!224891)))) ((_ sign_extend 32) (currentByte!6321 (_2!6837 lt!224898))) ((_ sign_extend 32) (currentBit!6316 (_2!6837 lt!224898))) lt!224888)))

(declare-fun lt!224896 () Unit!9057)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5242 array!6608 (_ BitVec 32)) Unit!9057)

(assert (=> b!145162 (= lt!224896 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6837 lt!224898) (buf!3431 (_2!6837 lt!224891)) lt!224888))))

(declare-fun e!96774 () Bool)

(assert (=> b!145162 e!96774))

(declare-fun res!121355 () Bool)

(assert (=> b!145162 (=> (not res!121355) (not e!96774))))

(assert (=> b!145162 (= res!121355 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2992 (buf!3431 (_2!6837 lt!224891)))) ((_ sign_extend 32) (currentByte!6321 thiss!1634)) ((_ sign_extend 32) (currentBit!6316 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224889 () Unit!9057)

(assert (=> b!145162 (= lt!224889 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3431 (_2!6837 lt!224891)) (bvsub to!404 from!447)))))

(declare-fun lt!224887 () tuple2!12978)

(declare-datatypes ((tuple2!12984 0))(
  ( (tuple2!12985 (_1!6838 BitStream!5242) (_2!6838 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5242) tuple2!12984)

(assert (=> b!145162 (= (_2!6838 (readBytePure!0 (_1!6835 lt!224887))) (select (arr!3725 arr!237) from!447))))

(declare-fun lt!224902 () tuple2!12978)

(assert (=> b!145162 (= lt!224902 (reader!0 (_2!6837 lt!224898) (_2!6837 lt!224891)))))

(assert (=> b!145162 (= lt!224887 (reader!0 thiss!1634 (_2!6837 lt!224891)))))

(declare-fun e!96770 () Bool)

(assert (=> b!145162 e!96770))

(declare-fun res!121357 () Bool)

(assert (=> b!145162 (=> (not res!121357) (not e!96770))))

(declare-fun lt!224886 () tuple2!12984)

(declare-fun lt!224894 () tuple2!12984)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145162 (= res!121357 (= (bitIndex!0 (size!2992 (buf!3431 (_1!6838 lt!224886))) (currentByte!6321 (_1!6838 lt!224886)) (currentBit!6316 (_1!6838 lt!224886))) (bitIndex!0 (size!2992 (buf!3431 (_1!6838 lt!224894))) (currentByte!6321 (_1!6838 lt!224894)) (currentBit!6316 (_1!6838 lt!224894)))))))

(declare-fun lt!224903 () Unit!9057)

(declare-fun lt!224890 () BitStream!5242)

(declare-fun readBytePrefixLemma!0 (BitStream!5242 BitStream!5242) Unit!9057)

(assert (=> b!145162 (= lt!224903 (readBytePrefixLemma!0 lt!224890 (_2!6837 lt!224891)))))

(assert (=> b!145162 (= lt!224894 (readBytePure!0 (BitStream!5243 (buf!3431 (_2!6837 lt!224891)) (currentByte!6321 thiss!1634) (currentBit!6316 thiss!1634))))))

(assert (=> b!145162 (= lt!224886 (readBytePure!0 lt!224890))))

(assert (=> b!145162 (= lt!224890 (BitStream!5243 (buf!3431 (_2!6837 lt!224898)) (currentByte!6321 thiss!1634) (currentBit!6316 thiss!1634)))))

(declare-fun e!96769 () Bool)

(assert (=> b!145162 e!96769))

(declare-fun res!121359 () Bool)

(assert (=> b!145162 (=> (not res!121359) (not e!96769))))

(declare-fun isPrefixOf!0 (BitStream!5242 BitStream!5242) Bool)

(assert (=> b!145162 (= res!121359 (isPrefixOf!0 thiss!1634 (_2!6837 lt!224891)))))

(declare-fun lt!224904 () Unit!9057)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5242 BitStream!5242 BitStream!5242) Unit!9057)

(assert (=> b!145162 (= lt!224904 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6837 lt!224898) (_2!6837 lt!224891)))))

(declare-fun e!96772 () Bool)

(assert (=> b!145162 e!96772))

(declare-fun res!121365 () Bool)

(assert (=> b!145162 (=> (not res!121365) (not e!96772))))

(assert (=> b!145162 (= res!121365 (= (size!2992 (buf!3431 (_2!6837 lt!224898))) (size!2992 (buf!3431 (_2!6837 lt!224891)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5242 array!6608 (_ BitVec 32) (_ BitVec 32)) tuple2!12982)

(assert (=> b!145162 (= lt!224891 (appendByteArrayLoop!0 (_2!6837 lt!224898) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145162 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2992 (buf!3431 (_2!6837 lt!224898)))) ((_ sign_extend 32) (currentByte!6321 (_2!6837 lt!224898))) ((_ sign_extend 32) (currentBit!6316 (_2!6837 lt!224898))) lt!224888)))

(assert (=> b!145162 (= lt!224888 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224901 () Unit!9057)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5242 BitStream!5242 (_ BitVec 64) (_ BitVec 32)) Unit!9057)

(assert (=> b!145162 (= lt!224901 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6837 lt!224898) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!96771 () Bool)

(assert (=> b!145162 e!96771))

(declare-fun res!121364 () Bool)

(assert (=> b!145162 (=> (not res!121364) (not e!96771))))

(assert (=> b!145162 (= res!121364 (= (size!2992 (buf!3431 thiss!1634)) (size!2992 (buf!3431 (_2!6837 lt!224898)))))))

(declare-fun appendByte!0 (BitStream!5242 (_ BitVec 8)) tuple2!12982)

(assert (=> b!145162 (= lt!224898 (appendByte!0 thiss!1634 (select (arr!3725 arr!237) from!447)))))

(declare-fun b!145163 () Bool)

(declare-fun res!121366 () Bool)

(assert (=> b!145163 (=> (not res!121366) (not e!96771))))

(assert (=> b!145163 (= res!121366 (isPrefixOf!0 thiss!1634 (_2!6837 lt!224898)))))

(declare-fun b!145164 () Bool)

(declare-fun res!121358 () Bool)

(assert (=> b!145164 (=> (not res!121358) (not e!96776))))

(assert (=> b!145164 (= res!121358 (bvslt from!447 to!404))))

(declare-fun b!145165 () Bool)

(declare-fun res!121353 () Bool)

(assert (=> b!145165 (=> (not res!121353) (not e!96767))))

(assert (=> b!145165 (= res!121353 (isPrefixOf!0 (_2!6837 lt!224898) (_2!6837 lt!224891)))))

(declare-fun b!145166 () Bool)

(declare-fun res!121361 () Bool)

(assert (=> b!145166 (=> (not res!121361) (not e!96776))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145166 (= res!121361 (invariant!0 (currentBit!6316 thiss!1634) (currentByte!6321 thiss!1634) (size!2992 (buf!3431 thiss!1634))))))

(declare-fun b!145167 () Bool)

(assert (=> b!145167 (= e!96769 (invariant!0 (currentBit!6316 thiss!1634) (currentByte!6321 thiss!1634) (size!2992 (buf!3431 (_2!6837 lt!224898)))))))

(declare-fun res!121356 () Bool)

(assert (=> start!28016 (=> (not res!121356) (not e!96776))))

(assert (=> start!28016 (= res!121356 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2992 arr!237))))))

(assert (=> start!28016 e!96776))

(assert (=> start!28016 true))

(assert (=> start!28016 (array_inv!2781 arr!237)))

(declare-fun inv!12 (BitStream!5242) Bool)

(assert (=> start!28016 (and (inv!12 thiss!1634) e!96777)))

(declare-fun b!145168 () Bool)

(assert (=> b!145168 (= e!96770 (= (_2!6838 lt!224886) (_2!6838 lt!224894)))))

(declare-fun b!145169 () Bool)

(declare-fun res!121360 () Bool)

(assert (=> b!145169 (=> (not res!121360) (not e!96771))))

(assert (=> b!145169 (= res!121360 (= (bitIndex!0 (size!2992 (buf!3431 (_2!6837 lt!224898))) (currentByte!6321 (_2!6837 lt!224898)) (currentBit!6316 (_2!6837 lt!224898))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2992 (buf!3431 thiss!1634)) (currentByte!6321 thiss!1634) (currentBit!6316 thiss!1634)))))))

(declare-fun b!145170 () Bool)

(assert (=> b!145170 (= e!96774 (= (_1!6836 (readByteArrayLoopPure!0 (_1!6835 lt!224887) arr!237 from!447 to!404)) (_2!6835 lt!224887)))))

(declare-fun b!145171 () Bool)

(assert (=> b!145171 (= e!96772 e!96767)))

(declare-fun res!121363 () Bool)

(assert (=> b!145171 (=> (not res!121363) (not e!96767))))

(assert (=> b!145171 (= res!121363 (= (bitIndex!0 (size!2992 (buf!3431 (_2!6837 lt!224891))) (currentByte!6321 (_2!6837 lt!224891)) (currentBit!6316 (_2!6837 lt!224891))) (bvadd (bitIndex!0 (size!2992 (buf!3431 (_2!6837 lt!224898))) (currentByte!6321 (_2!6837 lt!224898)) (currentBit!6316 (_2!6837 lt!224898))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224900))))))

(assert (=> b!145171 (= lt!224900 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun lt!224893 () tuple2!12984)

(declare-fun b!145172 () Bool)

(declare-fun lt!224899 () tuple2!12978)

(assert (=> b!145172 (= e!96771 (and (= (_2!6838 lt!224893) (select (arr!3725 arr!237) from!447)) (= (_1!6838 lt!224893) (_2!6835 lt!224899))))))

(assert (=> b!145172 (= lt!224893 (readBytePure!0 (_1!6835 lt!224899)))))

(assert (=> b!145172 (= lt!224899 (reader!0 thiss!1634 (_2!6837 lt!224898)))))

(declare-fun b!145173 () Bool)

(declare-fun arrayRangesEq!308 (array!6608 array!6608 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145173 (= e!96768 (not (arrayRangesEq!308 arr!237 (_2!6836 lt!224897) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!145174 () Bool)

(declare-fun res!121362 () Bool)

(assert (=> b!145174 (=> (not res!121362) (not e!96776))))

(assert (=> b!145174 (= res!121362 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2992 (buf!3431 thiss!1634))) ((_ sign_extend 32) (currentByte!6321 thiss!1634)) ((_ sign_extend 32) (currentBit!6316 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!28016 res!121356) b!145174))

(assert (= (and b!145174 res!121362) b!145164))

(assert (= (and b!145164 res!121358) b!145166))

(assert (= (and b!145166 res!121361) b!145162))

(assert (= (and b!145162 res!121364) b!145169))

(assert (= (and b!145169 res!121360) b!145163))

(assert (= (and b!145163 res!121366) b!145172))

(assert (= (and b!145162 res!121365) b!145171))

(assert (= (and b!145171 res!121363) b!145165))

(assert (= (and b!145165 res!121353) b!145161))

(assert (= (and b!145161 (not res!121354)) b!145173))

(assert (= (and b!145162 res!121359) b!145167))

(assert (= (and b!145162 res!121357) b!145168))

(assert (= (and b!145162 res!121355) b!145170))

(assert (= start!28016 b!145160))

(declare-fun m!223283 () Bool)

(assert (=> b!145173 m!223283))

(declare-fun m!223285 () Bool)

(assert (=> b!145163 m!223285))

(declare-fun m!223287 () Bool)

(assert (=> b!145170 m!223287))

(declare-fun m!223289 () Bool)

(assert (=> b!145165 m!223289))

(declare-fun m!223291 () Bool)

(assert (=> b!145174 m!223291))

(declare-fun m!223293 () Bool)

(assert (=> b!145169 m!223293))

(declare-fun m!223295 () Bool)

(assert (=> b!145169 m!223295))

(declare-fun m!223297 () Bool)

(assert (=> start!28016 m!223297))

(declare-fun m!223299 () Bool)

(assert (=> start!28016 m!223299))

(declare-fun m!223301 () Bool)

(assert (=> b!145171 m!223301))

(assert (=> b!145171 m!223293))

(declare-fun m!223303 () Bool)

(assert (=> b!145166 m!223303))

(declare-fun m!223305 () Bool)

(assert (=> b!145161 m!223305))

(declare-fun m!223307 () Bool)

(assert (=> b!145161 m!223307))

(declare-fun m!223309 () Bool)

(assert (=> b!145161 m!223309))

(declare-fun m!223311 () Bool)

(assert (=> b!145161 m!223311))

(declare-fun m!223313 () Bool)

(assert (=> b!145167 m!223313))

(declare-fun m!223315 () Bool)

(assert (=> b!145172 m!223315))

(declare-fun m!223317 () Bool)

(assert (=> b!145172 m!223317))

(declare-fun m!223319 () Bool)

(assert (=> b!145172 m!223319))

(declare-fun m!223321 () Bool)

(assert (=> b!145160 m!223321))

(assert (=> b!145162 m!223311))

(declare-fun m!223323 () Bool)

(assert (=> b!145162 m!223323))

(declare-fun m!223325 () Bool)

(assert (=> b!145162 m!223325))

(declare-fun m!223327 () Bool)

(assert (=> b!145162 m!223327))

(declare-fun m!223329 () Bool)

(assert (=> b!145162 m!223329))

(declare-fun m!223331 () Bool)

(assert (=> b!145162 m!223331))

(declare-fun m!223333 () Bool)

(assert (=> b!145162 m!223333))

(declare-fun m!223335 () Bool)

(assert (=> b!145162 m!223335))

(declare-fun m!223337 () Bool)

(assert (=> b!145162 m!223337))

(declare-fun m!223339 () Bool)

(assert (=> b!145162 m!223339))

(declare-fun m!223341 () Bool)

(assert (=> b!145162 m!223341))

(assert (=> b!145162 m!223315))

(declare-fun m!223343 () Bool)

(assert (=> b!145162 m!223343))

(declare-fun m!223345 () Bool)

(assert (=> b!145162 m!223345))

(declare-fun m!223347 () Bool)

(assert (=> b!145162 m!223347))

(declare-fun m!223349 () Bool)

(assert (=> b!145162 m!223349))

(declare-fun m!223351 () Bool)

(assert (=> b!145162 m!223351))

(declare-fun m!223353 () Bool)

(assert (=> b!145162 m!223353))

(assert (=> b!145162 m!223315))

(declare-fun m!223355 () Bool)

(assert (=> b!145162 m!223355))

(push 1)

(assert (not b!145170))

(assert (not b!145171))

(assert (not b!145162))

(assert (not b!145173))

(assert (not b!145167))

(assert (not b!145165))

(assert (not b!145174))

(assert (not b!145169))

(assert (not b!145163))

(assert (not b!145160))

(assert (not b!145172))

(assert (not b!145166))

(assert (not b!145161))

(assert (not start!28016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

