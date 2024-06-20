; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22862 () Bool)

(assert start!22862)

(declare-fun b!115454 () Bool)

(declare-fun res!95412 () Bool)

(declare-fun e!75670 () Bool)

(assert (=> b!115454 (=> (not res!95412) (not e!75670))))

(declare-datatypes ((array!5207 0))(
  ( (array!5208 (arr!2955 (Array (_ BitVec 32) (_ BitVec 8))) (size!2362 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4198 0))(
  ( (BitStream!4199 (buf!2772 array!5207) (currentByte!5400 (_ BitVec 32)) (currentBit!5395 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4198)

(declare-datatypes ((Unit!7105 0))(
  ( (Unit!7106) )
))
(declare-datatypes ((tuple2!9508 0))(
  ( (tuple2!9509 (_1!5019 Unit!7105) (_2!5019 BitStream!4198)) )
))
(declare-fun lt!176238 () tuple2!9508)

(declare-fun isPrefixOf!0 (BitStream!4198 BitStream!4198) Bool)

(assert (=> b!115454 (= res!95412 (isPrefixOf!0 thiss!1305 (_2!5019 lt!176238)))))

(declare-fun res!95406 () Bool)

(declare-fun e!75672 () Bool)

(assert (=> start!22862 (=> (not res!95406) (not e!75672))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!22862 (= res!95406 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22862 e!75672))

(assert (=> start!22862 true))

(declare-fun e!75669 () Bool)

(declare-fun inv!12 (BitStream!4198) Bool)

(assert (=> start!22862 (and (inv!12 thiss!1305) e!75669)))

(declare-fun b!115455 () Bool)

(declare-fun array_inv!2164 (array!5207) Bool)

(assert (=> b!115455 (= e!75669 (array_inv!2164 (buf!2772 thiss!1305)))))

(declare-fun b!115456 () Bool)

(declare-fun res!95404 () Bool)

(assert (=> b!115456 (=> (not res!95404) (not e!75672))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115456 (= res!95404 (validate_offset_bits!1 ((_ sign_extend 32) (size!2362 (buf!2772 thiss!1305))) ((_ sign_extend 32) (currentByte!5400 thiss!1305)) ((_ sign_extend 32) (currentBit!5395 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!115457 () Bool)

(declare-fun e!75674 () Bool)

(declare-datatypes ((tuple2!9510 0))(
  ( (tuple2!9511 (_1!5020 BitStream!4198) (_2!5020 Bool)) )
))
(declare-fun lt!176234 () tuple2!9510)

(declare-fun lt!176243 () tuple2!9510)

(assert (=> b!115457 (= e!75674 (= (_2!5020 lt!176234) (_2!5020 lt!176243)))))

(declare-fun b!115458 () Bool)

(declare-fun e!75675 () Bool)

(declare-fun lt!176242 () tuple2!9510)

(declare-fun lt!176237 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115458 (= e!75675 (= (bitIndex!0 (size!2362 (buf!2772 (_1!5020 lt!176242))) (currentByte!5400 (_1!5020 lt!176242)) (currentBit!5395 (_1!5020 lt!176242))) lt!176237))))

(declare-fun b!115459 () Bool)

(declare-fun e!75671 () Bool)

(assert (=> b!115459 (= e!75671 e!75670)))

(declare-fun res!95405 () Bool)

(assert (=> b!115459 (=> (not res!95405) (not e!75670))))

(declare-fun lt!176239 () (_ BitVec 64))

(assert (=> b!115459 (= res!95405 (= lt!176237 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!176239)))))

(assert (=> b!115459 (= lt!176237 (bitIndex!0 (size!2362 (buf!2772 (_2!5019 lt!176238))) (currentByte!5400 (_2!5019 lt!176238)) (currentBit!5395 (_2!5019 lt!176238))))))

(assert (=> b!115459 (= lt!176239 (bitIndex!0 (size!2362 (buf!2772 thiss!1305)) (currentByte!5400 thiss!1305) (currentBit!5395 thiss!1305)))))

(declare-fun b!115460 () Bool)

(declare-fun e!75668 () Bool)

(declare-fun lt!176244 () tuple2!9508)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!115460 (= e!75668 (invariant!0 (currentBit!5395 thiss!1305) (currentByte!5400 thiss!1305) (size!2362 (buf!2772 (_2!5019 lt!176244)))))))

(declare-fun b!115461 () Bool)

(assert (=> b!115461 (= e!75672 (not (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!9512 0))(
  ( (tuple2!9513 (_1!5021 BitStream!4198) (_2!5021 BitStream!4198)) )
))
(declare-fun lt!176233 () tuple2!9512)

(declare-fun lt!176236 () Bool)

(declare-fun readBitPure!0 (BitStream!4198) tuple2!9510)

(assert (=> b!115461 (= (_2!5020 (readBitPure!0 (_1!5021 lt!176233))) lt!176236)))

(declare-fun lt!176232 () tuple2!9512)

(declare-fun reader!0 (BitStream!4198 BitStream!4198) tuple2!9512)

(assert (=> b!115461 (= lt!176232 (reader!0 (_2!5019 lt!176238) (_2!5019 lt!176244)))))

(assert (=> b!115461 (= lt!176233 (reader!0 thiss!1305 (_2!5019 lt!176244)))))

(assert (=> b!115461 e!75674))

(declare-fun res!95407 () Bool)

(assert (=> b!115461 (=> (not res!95407) (not e!75674))))

(assert (=> b!115461 (= res!95407 (= (bitIndex!0 (size!2362 (buf!2772 (_1!5020 lt!176234))) (currentByte!5400 (_1!5020 lt!176234)) (currentBit!5395 (_1!5020 lt!176234))) (bitIndex!0 (size!2362 (buf!2772 (_1!5020 lt!176243))) (currentByte!5400 (_1!5020 lt!176243)) (currentBit!5395 (_1!5020 lt!176243)))))))

(declare-fun lt!176241 () Unit!7105)

(declare-fun lt!176240 () BitStream!4198)

(declare-fun readBitPrefixLemma!0 (BitStream!4198 BitStream!4198) Unit!7105)

(assert (=> b!115461 (= lt!176241 (readBitPrefixLemma!0 lt!176240 (_2!5019 lt!176244)))))

(assert (=> b!115461 (= lt!176243 (readBitPure!0 (BitStream!4199 (buf!2772 (_2!5019 lt!176244)) (currentByte!5400 thiss!1305) (currentBit!5395 thiss!1305))))))

(assert (=> b!115461 (= lt!176234 (readBitPure!0 lt!176240))))

(assert (=> b!115461 (= lt!176240 (BitStream!4199 (buf!2772 (_2!5019 lt!176238)) (currentByte!5400 thiss!1305) (currentBit!5395 thiss!1305)))))

(assert (=> b!115461 e!75668))

(declare-fun res!95403 () Bool)

(assert (=> b!115461 (=> (not res!95403) (not e!75668))))

(assert (=> b!115461 (= res!95403 (isPrefixOf!0 thiss!1305 (_2!5019 lt!176244)))))

(declare-fun lt!176235 () Unit!7105)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4198 BitStream!4198 BitStream!4198) Unit!7105)

(assert (=> b!115461 (= lt!176235 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5019 lt!176238) (_2!5019 lt!176244)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4198 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9508)

(assert (=> b!115461 (= lt!176244 (appendNLeastSignificantBitsLoop!0 (_2!5019 lt!176238) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!115461 e!75671))

(declare-fun res!95409 () Bool)

(assert (=> b!115461 (=> (not res!95409) (not e!75671))))

(assert (=> b!115461 (= res!95409 (= (size!2362 (buf!2772 thiss!1305)) (size!2362 (buf!2772 (_2!5019 lt!176238)))))))

(declare-fun appendBit!0 (BitStream!4198 Bool) tuple2!9508)

(assert (=> b!115461 (= lt!176238 (appendBit!0 thiss!1305 lt!176236))))

(assert (=> b!115461 (= lt!176236 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115462 () Bool)

(assert (=> b!115462 (= e!75670 e!75675)))

(declare-fun res!95408 () Bool)

(assert (=> b!115462 (=> (not res!95408) (not e!75675))))

(assert (=> b!115462 (= res!95408 (and (= (_2!5020 lt!176242) lt!176236) (= (_1!5020 lt!176242) (_2!5019 lt!176238))))))

(declare-fun readerFrom!0 (BitStream!4198 (_ BitVec 32) (_ BitVec 32)) BitStream!4198)

(assert (=> b!115462 (= lt!176242 (readBitPure!0 (readerFrom!0 (_2!5019 lt!176238) (currentBit!5395 thiss!1305) (currentByte!5400 thiss!1305))))))

(declare-fun b!115463 () Bool)

(declare-fun res!95410 () Bool)

(assert (=> b!115463 (=> (not res!95410) (not e!75672))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115463 (= res!95410 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!115464 () Bool)

(declare-fun res!95411 () Bool)

(assert (=> b!115464 (=> (not res!95411) (not e!75672))))

(assert (=> b!115464 (= res!95411 (bvslt i!615 nBits!396))))

(declare-fun b!115465 () Bool)

(declare-fun res!95402 () Bool)

(assert (=> b!115465 (=> (not res!95402) (not e!75668))))

(assert (=> b!115465 (= res!95402 (invariant!0 (currentBit!5395 thiss!1305) (currentByte!5400 thiss!1305) (size!2362 (buf!2772 (_2!5019 lt!176238)))))))

(assert (= (and start!22862 res!95406) b!115456))

(assert (= (and b!115456 res!95404) b!115463))

(assert (= (and b!115463 res!95410) b!115464))

(assert (= (and b!115464 res!95411) b!115461))

(assert (= (and b!115461 res!95409) b!115459))

(assert (= (and b!115459 res!95405) b!115454))

(assert (= (and b!115454 res!95412) b!115462))

(assert (= (and b!115462 res!95408) b!115458))

(assert (= (and b!115461 res!95403) b!115465))

(assert (= (and b!115465 res!95402) b!115460))

(assert (= (and b!115461 res!95407) b!115457))

(assert (= start!22862 b!115455))

(declare-fun m!172811 () Bool)

(assert (=> b!115454 m!172811))

(declare-fun m!172813 () Bool)

(assert (=> b!115455 m!172813))

(declare-fun m!172815 () Bool)

(assert (=> b!115462 m!172815))

(assert (=> b!115462 m!172815))

(declare-fun m!172817 () Bool)

(assert (=> b!115462 m!172817))

(declare-fun m!172819 () Bool)

(assert (=> b!115465 m!172819))

(declare-fun m!172821 () Bool)

(assert (=> b!115459 m!172821))

(declare-fun m!172823 () Bool)

(assert (=> b!115459 m!172823))

(declare-fun m!172825 () Bool)

(assert (=> b!115460 m!172825))

(declare-fun m!172827 () Bool)

(assert (=> b!115456 m!172827))

(declare-fun m!172829 () Bool)

(assert (=> start!22862 m!172829))

(declare-fun m!172831 () Bool)

(assert (=> b!115458 m!172831))

(declare-fun m!172833 () Bool)

(assert (=> b!115461 m!172833))

(declare-fun m!172835 () Bool)

(assert (=> b!115461 m!172835))

(declare-fun m!172837 () Bool)

(assert (=> b!115461 m!172837))

(declare-fun m!172839 () Bool)

(assert (=> b!115461 m!172839))

(declare-fun m!172841 () Bool)

(assert (=> b!115461 m!172841))

(declare-fun m!172843 () Bool)

(assert (=> b!115461 m!172843))

(declare-fun m!172845 () Bool)

(assert (=> b!115461 m!172845))

(declare-fun m!172847 () Bool)

(assert (=> b!115461 m!172847))

(declare-fun m!172849 () Bool)

(assert (=> b!115461 m!172849))

(declare-fun m!172851 () Bool)

(assert (=> b!115461 m!172851))

(declare-fun m!172853 () Bool)

(assert (=> b!115461 m!172853))

(declare-fun m!172855 () Bool)

(assert (=> b!115461 m!172855))

(declare-fun m!172857 () Bool)

(assert (=> b!115463 m!172857))

(push 1)

(assert (not start!22862))

(assert (not b!115465))

(assert (not b!115459))

(assert (not b!115454))

(assert (not b!115456))

(assert (not b!115462))

(assert (not b!115460))

(assert (not b!115463))

(assert (not b!115455))

(assert (not b!115458))

(assert (not b!115461))

(check-sat)

(pop 1)

(push 1)

(check-sat)

