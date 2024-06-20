; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11808 () Bool)

(assert start!11808)

(declare-fun res!48672 () Bool)

(declare-fun e!38869 () Bool)

(assert (=> start!11808 (=> (not res!48672) (not e!38869))))

(declare-datatypes ((array!2665 0))(
  ( (array!2666 (arr!1772 (Array (_ BitVec 32) (_ BitVec 8))) (size!1208 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2665)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!11808 (= res!48672 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1208 srcBuffer!2))))))))

(assert (=> start!11808 e!38869))

(assert (=> start!11808 true))

(declare-fun array_inv!1111 (array!2665) Bool)

(assert (=> start!11808 (array_inv!1111 srcBuffer!2)))

(declare-datatypes ((BitStream!2104 0))(
  ( (BitStream!2105 (buf!1589 array!2665) (currentByte!3207 (_ BitVec 32)) (currentBit!3202 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2104)

(declare-fun e!38870 () Bool)

(declare-fun inv!12 (BitStream!2104) Bool)

(assert (=> start!11808 (and (inv!12 thiss!1379) e!38870)))

(declare-fun b!58572 () Bool)

(declare-fun e!38863 () Bool)

(declare-fun e!38871 () Bool)

(assert (=> b!58572 (= e!38863 e!38871)))

(declare-fun res!48661 () Bool)

(assert (=> b!58572 (=> res!48661 e!38871)))

(declare-datatypes ((Unit!4039 0))(
  ( (Unit!4040) )
))
(declare-datatypes ((tuple2!5330 0))(
  ( (tuple2!5331 (_1!2776 Unit!4039) (_2!2776 BitStream!2104)) )
))
(declare-fun lt!92446 () tuple2!5330)

(declare-fun isPrefixOf!0 (BitStream!2104 BitStream!2104) Bool)

(assert (=> b!58572 (= res!48661 (not (isPrefixOf!0 thiss!1379 (_2!2776 lt!92446))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58572 (validate_offset_bits!1 ((_ sign_extend 32) (size!1208 (buf!1589 (_2!2776 lt!92446)))) ((_ sign_extend 32) (currentByte!3207 (_2!2776 lt!92446))) ((_ sign_extend 32) (currentBit!3202 (_2!2776 lt!92446))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92443 () Unit!4039)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2104 BitStream!2104 (_ BitVec 64) (_ BitVec 64)) Unit!4039)

(assert (=> b!58572 (= lt!92443 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2776 lt!92446) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2104 (_ BitVec 8) (_ BitVec 32)) tuple2!5330)

(assert (=> b!58572 (= lt!92446 (appendBitFromByte!0 thiss!1379 (select (arr!1772 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58573 () Bool)

(assert (=> b!58573 (= e!38869 (not e!38863))))

(declare-fun res!48660 () Bool)

(assert (=> b!58573 (=> res!48660 e!38863)))

(assert (=> b!58573 (= res!48660 (bvsge i!635 to!314))))

(assert (=> b!58573 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92437 () Unit!4039)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2104) Unit!4039)

(assert (=> b!58573 (= lt!92437 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92445 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58573 (= lt!92445 (bitIndex!0 (size!1208 (buf!1589 thiss!1379)) (currentByte!3207 thiss!1379) (currentBit!3202 thiss!1379)))))

(declare-fun lt!92438 () (_ BitVec 64))

(declare-fun e!38866 () Bool)

(declare-fun b!58574 () Bool)

(assert (=> b!58574 (= e!38866 (= lt!92438 (bvsub (bvsub (bvadd (bitIndex!0 (size!1208 (buf!1589 (_2!2776 lt!92446))) (currentByte!3207 (_2!2776 lt!92446)) (currentBit!3202 (_2!2776 lt!92446))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58575 () Bool)

(declare-fun res!48665 () Bool)

(declare-fun e!38864 () Bool)

(assert (=> b!58575 (=> res!48665 e!38864)))

(declare-fun lt!92444 () tuple2!5330)

(assert (=> b!58575 (= res!48665 (not (= (size!1208 (buf!1589 thiss!1379)) (size!1208 (buf!1589 (_2!2776 lt!92444))))))))

(declare-fun b!58576 () Bool)

(assert (=> b!58576 (= e!38870 (array_inv!1111 (buf!1589 thiss!1379)))))

(declare-fun b!58577 () Bool)

(declare-fun res!48670 () Bool)

(assert (=> b!58577 (=> res!48670 e!38864)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58577 (= res!48670 (not (invariant!0 (currentBit!3202 (_2!2776 lt!92444)) (currentByte!3207 (_2!2776 lt!92444)) (size!1208 (buf!1589 (_2!2776 lt!92444))))))))

(declare-fun b!58578 () Bool)

(declare-fun res!48663 () Bool)

(declare-fun e!38873 () Bool)

(assert (=> b!58578 (=> res!48663 e!38873)))

(assert (=> b!58578 (= res!48663 (not (invariant!0 (currentBit!3202 (_2!2776 lt!92446)) (currentByte!3207 (_2!2776 lt!92446)) (size!1208 (buf!1589 (_2!2776 lt!92446))))))))

(declare-fun b!58579 () Bool)

(declare-fun res!48662 () Bool)

(assert (=> b!58579 (=> res!48662 e!38873)))

(assert (=> b!58579 (= res!48662 (not (invariant!0 (currentBit!3202 (_2!2776 lt!92446)) (currentByte!3207 (_2!2776 lt!92446)) (size!1208 (buf!1589 (_2!2776 lt!92444))))))))

(declare-fun b!58580 () Bool)

(declare-fun res!48668 () Bool)

(assert (=> b!58580 (=> (not res!48668) (not e!38869))))

(assert (=> b!58580 (= res!48668 (validate_offset_bits!1 ((_ sign_extend 32) (size!1208 (buf!1589 thiss!1379))) ((_ sign_extend 32) (currentByte!3207 thiss!1379)) ((_ sign_extend 32) (currentBit!3202 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58581 () Bool)

(assert (=> b!58581 (= e!38864 e!38873)))

(declare-fun res!48671 () Bool)

(assert (=> b!58581 (=> res!48671 e!38873)))

(assert (=> b!58581 (= res!48671 (not (= (size!1208 (buf!1589 (_2!2776 lt!92446))) (size!1208 (buf!1589 (_2!2776 lt!92444))))))))

(assert (=> b!58581 e!38866))

(declare-fun res!48669 () Bool)

(assert (=> b!58581 (=> (not res!48669) (not e!38866))))

(assert (=> b!58581 (= res!48669 (= (size!1208 (buf!1589 (_2!2776 lt!92444))) (size!1208 (buf!1589 thiss!1379))))))

(declare-fun b!58582 () Bool)

(assert (=> b!58582 (= e!38873 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!5332 0))(
  ( (tuple2!5333 (_1!2777 BitStream!2104) (_2!2777 BitStream!2104)) )
))
(declare-fun lt!92435 () tuple2!5332)

(declare-fun reader!0 (BitStream!2104 BitStream!2104) tuple2!5332)

(assert (=> b!58582 (= lt!92435 (reader!0 (_2!2776 lt!92446) (_2!2776 lt!92444)))))

(assert (=> b!58582 (validate_offset_bits!1 ((_ sign_extend 32) (size!1208 (buf!1589 (_2!2776 lt!92444)))) ((_ sign_extend 32) (currentByte!3207 thiss!1379)) ((_ sign_extend 32) (currentBit!3202 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92442 () Unit!4039)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2104 array!2665 (_ BitVec 64)) Unit!4039)

(assert (=> b!58582 (= lt!92442 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1589 (_2!2776 lt!92444)) (bvsub to!314 i!635)))))

(declare-fun lt!92439 () tuple2!5332)

(assert (=> b!58582 (= lt!92439 (reader!0 thiss!1379 (_2!2776 lt!92444)))))

(declare-fun b!58583 () Bool)

(declare-fun e!38865 () Bool)

(assert (=> b!58583 (= e!38871 e!38865)))

(declare-fun res!48667 () Bool)

(assert (=> b!58583 (=> res!48667 e!38865)))

(assert (=> b!58583 (= res!48667 (not (isPrefixOf!0 (_2!2776 lt!92446) (_2!2776 lt!92444))))))

(assert (=> b!58583 (isPrefixOf!0 thiss!1379 (_2!2776 lt!92444))))

(declare-fun lt!92441 () Unit!4039)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2104 BitStream!2104 BitStream!2104) Unit!4039)

(assert (=> b!58583 (= lt!92441 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2776 lt!92446) (_2!2776 lt!92444)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2104 array!2665 (_ BitVec 64) (_ BitVec 64)) tuple2!5330)

(assert (=> b!58583 (= lt!92444 (appendBitsMSBFirstLoop!0 (_2!2776 lt!92446) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!38867 () Bool)

(assert (=> b!58583 e!38867))

(declare-fun res!48664 () Bool)

(assert (=> b!58583 (=> (not res!48664) (not e!38867))))

(assert (=> b!58583 (= res!48664 (validate_offset_bits!1 ((_ sign_extend 32) (size!1208 (buf!1589 (_2!2776 lt!92446)))) ((_ sign_extend 32) (currentByte!3207 thiss!1379)) ((_ sign_extend 32) (currentBit!3202 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92440 () Unit!4039)

(assert (=> b!58583 (= lt!92440 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1589 (_2!2776 lt!92446)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92436 () tuple2!5332)

(assert (=> b!58583 (= lt!92436 (reader!0 thiss!1379 (_2!2776 lt!92446)))))

(declare-fun b!58584 () Bool)

(assert (=> b!58584 (= e!38865 e!38864)))

(declare-fun res!48666 () Bool)

(assert (=> b!58584 (=> res!48666 e!38864)))

(assert (=> b!58584 (= res!48666 (not (= lt!92438 (bvsub (bvadd lt!92445 to!314) i!635))))))

(assert (=> b!58584 (= lt!92438 (bitIndex!0 (size!1208 (buf!1589 (_2!2776 lt!92444))) (currentByte!3207 (_2!2776 lt!92444)) (currentBit!3202 (_2!2776 lt!92444))))))

(declare-fun b!58585 () Bool)

(declare-datatypes ((List!627 0))(
  ( (Nil!624) (Cons!623 (h!742 Bool) (t!1377 List!627)) )
))
(declare-fun head!446 (List!627) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2104 array!2665 (_ BitVec 64) (_ BitVec 64)) List!627)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2104 BitStream!2104 (_ BitVec 64)) List!627)

(assert (=> b!58585 (= e!38867 (= (head!446 (byteArrayBitContentToList!0 (_2!2776 lt!92446) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!446 (bitStreamReadBitsIntoList!0 (_2!2776 lt!92446) (_1!2777 lt!92436) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!11808 res!48672) b!58580))

(assert (= (and b!58580 res!48668) b!58573))

(assert (= (and b!58573 (not res!48660)) b!58572))

(assert (= (and b!58572 (not res!48661)) b!58583))

(assert (= (and b!58583 res!48664) b!58585))

(assert (= (and b!58583 (not res!48667)) b!58584))

(assert (= (and b!58584 (not res!48666)) b!58577))

(assert (= (and b!58577 (not res!48670)) b!58575))

(assert (= (and b!58575 (not res!48665)) b!58581))

(assert (= (and b!58581 res!48669) b!58574))

(assert (= (and b!58581 (not res!48671)) b!58578))

(assert (= (and b!58578 (not res!48663)) b!58579))

(assert (= (and b!58579 (not res!48662)) b!58582))

(assert (= start!11808 b!58576))

(declare-fun m!92257 () Bool)

(assert (=> b!58573 m!92257))

(declare-fun m!92259 () Bool)

(assert (=> b!58573 m!92259))

(declare-fun m!92261 () Bool)

(assert (=> b!58573 m!92261))

(declare-fun m!92263 () Bool)

(assert (=> b!58574 m!92263))

(declare-fun m!92265 () Bool)

(assert (=> b!58585 m!92265))

(assert (=> b!58585 m!92265))

(declare-fun m!92267 () Bool)

(assert (=> b!58585 m!92267))

(declare-fun m!92269 () Bool)

(assert (=> b!58585 m!92269))

(assert (=> b!58585 m!92269))

(declare-fun m!92271 () Bool)

(assert (=> b!58585 m!92271))

(declare-fun m!92273 () Bool)

(assert (=> b!58577 m!92273))

(declare-fun m!92275 () Bool)

(assert (=> b!58579 m!92275))

(declare-fun m!92277 () Bool)

(assert (=> b!58576 m!92277))

(declare-fun m!92279 () Bool)

(assert (=> b!58572 m!92279))

(declare-fun m!92281 () Bool)

(assert (=> b!58572 m!92281))

(declare-fun m!92283 () Bool)

(assert (=> b!58572 m!92283))

(declare-fun m!92285 () Bool)

(assert (=> b!58572 m!92285))

(assert (=> b!58572 m!92281))

(declare-fun m!92287 () Bool)

(assert (=> b!58572 m!92287))

(declare-fun m!92289 () Bool)

(assert (=> b!58578 m!92289))

(declare-fun m!92291 () Bool)

(assert (=> b!58580 m!92291))

(declare-fun m!92293 () Bool)

(assert (=> b!58583 m!92293))

(declare-fun m!92295 () Bool)

(assert (=> b!58583 m!92295))

(declare-fun m!92297 () Bool)

(assert (=> b!58583 m!92297))

(declare-fun m!92299 () Bool)

(assert (=> b!58583 m!92299))

(declare-fun m!92301 () Bool)

(assert (=> b!58583 m!92301))

(declare-fun m!92303 () Bool)

(assert (=> b!58583 m!92303))

(declare-fun m!92305 () Bool)

(assert (=> b!58583 m!92305))

(declare-fun m!92307 () Bool)

(assert (=> start!11808 m!92307))

(declare-fun m!92309 () Bool)

(assert (=> start!11808 m!92309))

(declare-fun m!92311 () Bool)

(assert (=> b!58582 m!92311))

(declare-fun m!92313 () Bool)

(assert (=> b!58582 m!92313))

(declare-fun m!92315 () Bool)

(assert (=> b!58582 m!92315))

(declare-fun m!92317 () Bool)

(assert (=> b!58582 m!92317))

(declare-fun m!92319 () Bool)

(assert (=> b!58584 m!92319))

(push 1)

(assert (not b!58577))

(assert (not b!58578))

(assert (not b!58584))

(assert (not b!58582))

(assert (not b!58580))

(assert (not b!58579))

(assert (not b!58585))

(assert (not b!58573))

(assert (not b!58572))

(assert (not b!58576))

(assert (not start!11808))

(assert (not b!58583))

(assert (not b!58574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

