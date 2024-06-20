; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24164 () Bool)

(assert start!24164)

(declare-fun b!122364 () Bool)

(declare-fun e!80169 () Bool)

(declare-fun e!80168 () Bool)

(assert (=> b!122364 (= e!80169 e!80168)))

(declare-fun res!101400 () Bool)

(assert (=> b!122364 (=> (not res!101400) (not e!80168))))

(declare-fun lt!192446 () (_ BitVec 64))

(declare-fun lt!192435 () (_ BitVec 64))

(assert (=> b!122364 (= res!101400 (= lt!192446 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!192435)))))

(declare-datatypes ((array!5414 0))(
  ( (array!5415 (arr!3042 (Array (_ BitVec 32) (_ BitVec 8))) (size!2449 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4372 0))(
  ( (BitStream!4373 (buf!2889 array!5414) (currentByte!5586 (_ BitVec 32)) (currentBit!5581 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7537 0))(
  ( (Unit!7538) )
))
(declare-datatypes ((tuple2!10312 0))(
  ( (tuple2!10313 (_1!5421 Unit!7537) (_2!5421 BitStream!4372)) )
))
(declare-fun lt!192425 () tuple2!10312)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122364 (= lt!192446 (bitIndex!0 (size!2449 (buf!2889 (_2!5421 lt!192425))) (currentByte!5586 (_2!5421 lt!192425)) (currentBit!5581 (_2!5421 lt!192425))))))

(declare-fun thiss!1305 () BitStream!4372)

(assert (=> b!122364 (= lt!192435 (bitIndex!0 (size!2449 (buf!2889 thiss!1305)) (currentByte!5586 thiss!1305) (currentBit!5581 thiss!1305)))))

(declare-fun b!122365 () Bool)

(declare-fun e!80170 () Bool)

(assert (=> b!122365 (= e!80170 true)))

(declare-fun e!80172 () Bool)

(assert (=> b!122365 e!80172))

(declare-fun res!101392 () Bool)

(assert (=> b!122365 (=> (not res!101392) (not e!80172))))

(declare-fun lt!192453 () (_ BitVec 64))

(declare-datatypes ((tuple2!10314 0))(
  ( (tuple2!10315 (_1!5422 BitStream!4372) (_2!5422 BitStream!4372)) )
))
(declare-fun lt!192440 () tuple2!10314)

(declare-fun lt!192430 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4372 (_ BitVec 64)) BitStream!4372)

(assert (=> b!122365 (= res!101392 (= (_1!5422 lt!192440) (withMovedBitIndex!0 (_2!5422 lt!192440) (bvsub lt!192430 lt!192453))))))

(assert (=> b!122365 (= lt!192430 (bitIndex!0 (size!2449 (buf!2889 (_2!5421 lt!192425))) (currentByte!5586 (_2!5421 lt!192425)) (currentBit!5581 (_2!5421 lt!192425))))))

(declare-fun lt!192441 () tuple2!10314)

(declare-fun lt!192438 () (_ BitVec 64))

(assert (=> b!122365 (= (_1!5422 lt!192441) (withMovedBitIndex!0 (_2!5422 lt!192441) (bvsub lt!192438 lt!192453)))))

(declare-fun lt!192443 () tuple2!10312)

(assert (=> b!122365 (= lt!192453 (bitIndex!0 (size!2449 (buf!2889 (_2!5421 lt!192443))) (currentByte!5586 (_2!5421 lt!192443)) (currentBit!5581 (_2!5421 lt!192443))))))

(assert (=> b!122365 (= lt!192438 (bitIndex!0 (size!2449 (buf!2889 thiss!1305)) (currentByte!5586 thiss!1305) (currentBit!5581 thiss!1305)))))

(declare-datatypes ((tuple2!10316 0))(
  ( (tuple2!10317 (_1!5423 BitStream!4372) (_2!5423 (_ BitVec 64))) )
))
(declare-fun lt!192434 () tuple2!10316)

(declare-fun lt!192442 () tuple2!10316)

(assert (=> b!122365 (and (= (_2!5423 lt!192434) (_2!5423 lt!192442)) (= (_1!5423 lt!192434) (_1!5423 lt!192442)))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!192450 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!192429 () Unit!7537)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7537)

(assert (=> b!122365 (= lt!192429 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5422 lt!192441) nBits!396 i!615 lt!192450))))

(declare-fun lt!192447 () (_ BitVec 64))

(declare-fun lt!192437 () BitStream!4372)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10316)

(assert (=> b!122365 (= lt!192442 (readNLeastSignificantBitsLoopPure!0 lt!192437 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192447))))

(assert (=> b!122365 (= lt!192437 (withMovedBitIndex!0 (_1!5422 lt!192441) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!122366 () Bool)

(declare-fun lt!192445 () tuple2!10316)

(assert (=> b!122366 (= e!80172 (and (= lt!192438 (bvsub lt!192430 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5422 lt!192440) lt!192437)) (and (= (_2!5423 lt!192434) (_2!5423 lt!192445)) (= (_1!5423 lt!192434) (_2!5422 lt!192441))))))))

(declare-fun b!122367 () Bool)

(declare-fun res!101403 () Bool)

(assert (=> b!122367 (=> (not res!101403) (not e!80168))))

(declare-fun isPrefixOf!0 (BitStream!4372 BitStream!4372) Bool)

(assert (=> b!122367 (= res!101403 (isPrefixOf!0 thiss!1305 (_2!5421 lt!192425)))))

(declare-fun b!122368 () Bool)

(declare-fun e!80166 () Bool)

(declare-datatypes ((tuple2!10318 0))(
  ( (tuple2!10319 (_1!5424 BitStream!4372) (_2!5424 Bool)) )
))
(declare-fun lt!192449 () tuple2!10318)

(assert (=> b!122368 (= e!80166 (= (bitIndex!0 (size!2449 (buf!2889 (_1!5424 lt!192449))) (currentByte!5586 (_1!5424 lt!192449)) (currentBit!5581 (_1!5424 lt!192449))) lt!192446))))

(declare-fun b!122369 () Bool)

(declare-fun res!101398 () Bool)

(declare-fun e!80175 () Bool)

(assert (=> b!122369 (=> (not res!101398) (not e!80175))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122369 (= res!101398 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!122370 () Bool)

(declare-fun e!80167 () Bool)

(declare-fun lt!192427 () tuple2!10318)

(declare-fun lt!192448 () tuple2!10318)

(assert (=> b!122370 (= e!80167 (= (_2!5424 lt!192427) (_2!5424 lt!192448)))))

(declare-fun b!122371 () Bool)

(assert (=> b!122371 (= e!80175 (not e!80170))))

(declare-fun res!101402 () Bool)

(assert (=> b!122371 (=> res!101402 e!80170)))

(assert (=> b!122371 (= res!101402 (not (= (_1!5423 lt!192445) (_2!5422 lt!192440))))))

(assert (=> b!122371 (= lt!192445 (readNLeastSignificantBitsLoopPure!0 (_1!5422 lt!192440) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192447))))

(declare-fun lt!192433 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122371 (validate_offset_bits!1 ((_ sign_extend 32) (size!2449 (buf!2889 (_2!5421 lt!192443)))) ((_ sign_extend 32) (currentByte!5586 (_2!5421 lt!192425))) ((_ sign_extend 32) (currentBit!5581 (_2!5421 lt!192425))) lt!192433)))

(declare-fun lt!192444 () Unit!7537)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4372 array!5414 (_ BitVec 64)) Unit!7537)

(assert (=> b!122371 (= lt!192444 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5421 lt!192425) (buf!2889 (_2!5421 lt!192443)) lt!192433))))

(assert (=> b!122371 (= lt!192433 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!192439 () (_ BitVec 64))

(declare-fun lt!192436 () tuple2!10318)

(assert (=> b!122371 (= lt!192447 (bvor lt!192450 (ite (_2!5424 lt!192436) lt!192439 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122371 (= lt!192434 (readNLeastSignificantBitsLoopPure!0 (_1!5422 lt!192441) nBits!396 i!615 lt!192450))))

(declare-fun lt!192426 () (_ BitVec 64))

(assert (=> b!122371 (validate_offset_bits!1 ((_ sign_extend 32) (size!2449 (buf!2889 (_2!5421 lt!192443)))) ((_ sign_extend 32) (currentByte!5586 thiss!1305)) ((_ sign_extend 32) (currentBit!5581 thiss!1305)) lt!192426)))

(declare-fun lt!192451 () Unit!7537)

(assert (=> b!122371 (= lt!192451 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2889 (_2!5421 lt!192443)) lt!192426))))

(assert (=> b!122371 (= lt!192450 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!192431 () Bool)

(assert (=> b!122371 (= (_2!5424 lt!192436) lt!192431)))

(declare-fun readBitPure!0 (BitStream!4372) tuple2!10318)

(assert (=> b!122371 (= lt!192436 (readBitPure!0 (_1!5422 lt!192441)))))

(declare-fun reader!0 (BitStream!4372 BitStream!4372) tuple2!10314)

(assert (=> b!122371 (= lt!192440 (reader!0 (_2!5421 lt!192425) (_2!5421 lt!192443)))))

(assert (=> b!122371 (= lt!192441 (reader!0 thiss!1305 (_2!5421 lt!192443)))))

(assert (=> b!122371 e!80167))

(declare-fun res!101401 () Bool)

(assert (=> b!122371 (=> (not res!101401) (not e!80167))))

(assert (=> b!122371 (= res!101401 (= (bitIndex!0 (size!2449 (buf!2889 (_1!5424 lt!192427))) (currentByte!5586 (_1!5424 lt!192427)) (currentBit!5581 (_1!5424 lt!192427))) (bitIndex!0 (size!2449 (buf!2889 (_1!5424 lt!192448))) (currentByte!5586 (_1!5424 lt!192448)) (currentBit!5581 (_1!5424 lt!192448)))))))

(declare-fun lt!192452 () Unit!7537)

(declare-fun lt!192432 () BitStream!4372)

(declare-fun readBitPrefixLemma!0 (BitStream!4372 BitStream!4372) Unit!7537)

(assert (=> b!122371 (= lt!192452 (readBitPrefixLemma!0 lt!192432 (_2!5421 lt!192443)))))

(assert (=> b!122371 (= lt!192448 (readBitPure!0 (BitStream!4373 (buf!2889 (_2!5421 lt!192443)) (currentByte!5586 thiss!1305) (currentBit!5581 thiss!1305))))))

(assert (=> b!122371 (= lt!192427 (readBitPure!0 lt!192432))))

(assert (=> b!122371 (= lt!192432 (BitStream!4373 (buf!2889 (_2!5421 lt!192425)) (currentByte!5586 thiss!1305) (currentBit!5581 thiss!1305)))))

(declare-fun e!80165 () Bool)

(assert (=> b!122371 e!80165))

(declare-fun res!101395 () Bool)

(assert (=> b!122371 (=> (not res!101395) (not e!80165))))

(assert (=> b!122371 (= res!101395 (isPrefixOf!0 thiss!1305 (_2!5421 lt!192443)))))

(declare-fun lt!192428 () Unit!7537)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4372 BitStream!4372 BitStream!4372) Unit!7537)

(assert (=> b!122371 (= lt!192428 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5421 lt!192425) (_2!5421 lt!192443)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4372 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10312)

(assert (=> b!122371 (= lt!192443 (appendNLeastSignificantBitsLoop!0 (_2!5421 lt!192425) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!122371 e!80169))

(declare-fun res!101399 () Bool)

(assert (=> b!122371 (=> (not res!101399) (not e!80169))))

(assert (=> b!122371 (= res!101399 (= (size!2449 (buf!2889 thiss!1305)) (size!2449 (buf!2889 (_2!5421 lt!192425)))))))

(declare-fun appendBit!0 (BitStream!4372 Bool) tuple2!10312)

(assert (=> b!122371 (= lt!192425 (appendBit!0 thiss!1305 lt!192431))))

(assert (=> b!122371 (= lt!192431 (not (= (bvand v!199 lt!192439) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122371 (= lt!192439 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122372 () Bool)

(declare-fun res!101397 () Bool)

(assert (=> b!122372 (=> (not res!101397) (not e!80175))))

(assert (=> b!122372 (= res!101397 (bvslt i!615 nBits!396))))

(declare-fun b!122373 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122373 (= e!80165 (invariant!0 (currentBit!5581 thiss!1305) (currentByte!5586 thiss!1305) (size!2449 (buf!2889 (_2!5421 lt!192443)))))))

(declare-fun b!122374 () Bool)

(declare-fun e!80173 () Bool)

(assert (=> b!122374 (= e!80173 e!80175)))

(declare-fun res!101391 () Bool)

(assert (=> b!122374 (=> (not res!101391) (not e!80175))))

(assert (=> b!122374 (= res!101391 (validate_offset_bits!1 ((_ sign_extend 32) (size!2449 (buf!2889 thiss!1305))) ((_ sign_extend 32) (currentByte!5586 thiss!1305)) ((_ sign_extend 32) (currentBit!5581 thiss!1305)) lt!192426))))

(assert (=> b!122374 (= lt!192426 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122375 () Bool)

(assert (=> b!122375 (= e!80168 e!80166)))

(declare-fun res!101393 () Bool)

(assert (=> b!122375 (=> (not res!101393) (not e!80166))))

(assert (=> b!122375 (= res!101393 (and (= (_2!5424 lt!192449) lt!192431) (= (_1!5424 lt!192449) (_2!5421 lt!192425))))))

(declare-fun readerFrom!0 (BitStream!4372 (_ BitVec 32) (_ BitVec 32)) BitStream!4372)

(assert (=> b!122375 (= lt!192449 (readBitPure!0 (readerFrom!0 (_2!5421 lt!192425) (currentBit!5581 thiss!1305) (currentByte!5586 thiss!1305))))))

(declare-fun b!122376 () Bool)

(declare-fun e!80174 () Bool)

(declare-fun array_inv!2251 (array!5414) Bool)

(assert (=> b!122376 (= e!80174 (array_inv!2251 (buf!2889 thiss!1305)))))

(declare-fun b!122377 () Bool)

(declare-fun res!101396 () Bool)

(assert (=> b!122377 (=> (not res!101396) (not e!80165))))

(assert (=> b!122377 (= res!101396 (invariant!0 (currentBit!5581 thiss!1305) (currentByte!5586 thiss!1305) (size!2449 (buf!2889 (_2!5421 lt!192425)))))))

(declare-fun res!101394 () Bool)

(assert (=> start!24164 (=> (not res!101394) (not e!80173))))

(assert (=> start!24164 (= res!101394 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24164 e!80173))

(assert (=> start!24164 true))

(declare-fun inv!12 (BitStream!4372) Bool)

(assert (=> start!24164 (and (inv!12 thiss!1305) e!80174)))

(assert (= (and start!24164 res!101394) b!122374))

(assert (= (and b!122374 res!101391) b!122369))

(assert (= (and b!122369 res!101398) b!122372))

(assert (= (and b!122372 res!101397) b!122371))

(assert (= (and b!122371 res!101399) b!122364))

(assert (= (and b!122364 res!101400) b!122367))

(assert (= (and b!122367 res!101403) b!122375))

(assert (= (and b!122375 res!101393) b!122368))

(assert (= (and b!122371 res!101395) b!122377))

(assert (= (and b!122377 res!101396) b!122373))

(assert (= (and b!122371 res!101401) b!122370))

(assert (= (and b!122371 (not res!101402)) b!122365))

(assert (= (and b!122365 res!101392) b!122366))

(assert (= start!24164 b!122376))

(declare-fun m!185825 () Bool)

(assert (=> b!122375 m!185825))

(assert (=> b!122375 m!185825))

(declare-fun m!185827 () Bool)

(assert (=> b!122375 m!185827))

(declare-fun m!185829 () Bool)

(assert (=> b!122368 m!185829))

(declare-fun m!185831 () Bool)

(assert (=> b!122376 m!185831))

(declare-fun m!185833 () Bool)

(assert (=> start!24164 m!185833))

(declare-fun m!185835 () Bool)

(assert (=> b!122367 m!185835))

(declare-fun m!185837 () Bool)

(assert (=> b!122373 m!185837))

(declare-fun m!185839 () Bool)

(assert (=> b!122364 m!185839))

(declare-fun m!185841 () Bool)

(assert (=> b!122364 m!185841))

(declare-fun m!185843 () Bool)

(assert (=> b!122377 m!185843))

(declare-fun m!185845 () Bool)

(assert (=> b!122374 m!185845))

(declare-fun m!185847 () Bool)

(assert (=> b!122371 m!185847))

(declare-fun m!185849 () Bool)

(assert (=> b!122371 m!185849))

(declare-fun m!185851 () Bool)

(assert (=> b!122371 m!185851))

(declare-fun m!185853 () Bool)

(assert (=> b!122371 m!185853))

(declare-fun m!185855 () Bool)

(assert (=> b!122371 m!185855))

(declare-fun m!185857 () Bool)

(assert (=> b!122371 m!185857))

(declare-fun m!185859 () Bool)

(assert (=> b!122371 m!185859))

(declare-fun m!185861 () Bool)

(assert (=> b!122371 m!185861))

(declare-fun m!185863 () Bool)

(assert (=> b!122371 m!185863))

(declare-fun m!185865 () Bool)

(assert (=> b!122371 m!185865))

(declare-fun m!185867 () Bool)

(assert (=> b!122371 m!185867))

(declare-fun m!185869 () Bool)

(assert (=> b!122371 m!185869))

(declare-fun m!185871 () Bool)

(assert (=> b!122371 m!185871))

(declare-fun m!185873 () Bool)

(assert (=> b!122371 m!185873))

(declare-fun m!185875 () Bool)

(assert (=> b!122371 m!185875))

(declare-fun m!185877 () Bool)

(assert (=> b!122371 m!185877))

(declare-fun m!185879 () Bool)

(assert (=> b!122371 m!185879))

(declare-fun m!185881 () Bool)

(assert (=> b!122371 m!185881))

(declare-fun m!185883 () Bool)

(assert (=> b!122371 m!185883))

(declare-fun m!185885 () Bool)

(assert (=> b!122369 m!185885))

(declare-fun m!185887 () Bool)

(assert (=> b!122365 m!185887))

(declare-fun m!185889 () Bool)

(assert (=> b!122365 m!185889))

(assert (=> b!122365 m!185841))

(declare-fun m!185891 () Bool)

(assert (=> b!122365 m!185891))

(assert (=> b!122365 m!185839))

(declare-fun m!185893 () Bool)

(assert (=> b!122365 m!185893))

(declare-fun m!185895 () Bool)

(assert (=> b!122365 m!185895))

(declare-fun m!185897 () Bool)

(assert (=> b!122365 m!185897))

(push 1)

(assert (not b!122369))

(assert (not b!122367))

(assert (not b!122377))

(assert (not b!122368))

(assert (not b!122375))

(assert (not b!122374))

(assert (not b!122365))

(assert (not b!122364))

(assert (not start!24164))

(assert (not b!122371))

(assert (not b!122376))

(assert (not b!122373))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

