; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24166 () Bool)

(assert start!24166)

(declare-fun b!122406 () Bool)

(declare-fun res!101435 () Bool)

(declare-fun e!80203 () Bool)

(assert (=> b!122406 (=> (not res!101435) (not e!80203))))

(declare-datatypes ((array!5416 0))(
  ( (array!5417 (arr!3043 (Array (_ BitVec 32) (_ BitVec 8))) (size!2450 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4374 0))(
  ( (BitStream!4375 (buf!2890 array!5416) (currentByte!5587 (_ BitVec 32)) (currentBit!5582 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4374)

(declare-datatypes ((Unit!7539 0))(
  ( (Unit!7540) )
))
(declare-datatypes ((tuple2!10320 0))(
  ( (tuple2!10321 (_1!5425 Unit!7539) (_2!5425 BitStream!4374)) )
))
(declare-fun lt!192535 () tuple2!10320)

(declare-fun isPrefixOf!0 (BitStream!4374 BitStream!4374) Bool)

(assert (=> b!122406 (= res!101435 (isPrefixOf!0 thiss!1305 (_2!5425 lt!192535)))))

(declare-fun b!122407 () Bool)

(declare-fun e!80202 () Bool)

(declare-datatypes ((tuple2!10322 0))(
  ( (tuple2!10323 (_1!5426 BitStream!4374) (_2!5426 Bool)) )
))
(declare-fun lt!192536 () tuple2!10322)

(declare-fun lt!192518 () tuple2!10322)

(assert (=> b!122407 (= e!80202 (= (_2!5426 lt!192536) (_2!5426 lt!192518)))))

(declare-fun b!122408 () Bool)

(declare-fun e!80204 () Bool)

(assert (=> b!122408 (= e!80204 true)))

(declare-fun e!80199 () Bool)

(assert (=> b!122408 e!80199))

(declare-fun res!101438 () Bool)

(assert (=> b!122408 (=> (not res!101438) (not e!80199))))

(declare-fun lt!192528 () (_ BitVec 64))

(declare-fun lt!192515 () (_ BitVec 64))

(declare-datatypes ((tuple2!10324 0))(
  ( (tuple2!10325 (_1!5427 BitStream!4374) (_2!5427 BitStream!4374)) )
))
(declare-fun lt!192519 () tuple2!10324)

(declare-fun withMovedBitIndex!0 (BitStream!4374 (_ BitVec 64)) BitStream!4374)

(assert (=> b!122408 (= res!101438 (= (_1!5427 lt!192519) (withMovedBitIndex!0 (_2!5427 lt!192519) (bvsub lt!192528 lt!192515))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122408 (= lt!192528 (bitIndex!0 (size!2450 (buf!2890 (_2!5425 lt!192535))) (currentByte!5587 (_2!5425 lt!192535)) (currentBit!5582 (_2!5425 lt!192535))))))

(declare-fun lt!192522 () tuple2!10324)

(declare-fun lt!192521 () (_ BitVec 64))

(assert (=> b!122408 (= (_1!5427 lt!192522) (withMovedBitIndex!0 (_2!5427 lt!192522) (bvsub lt!192521 lt!192515)))))

(declare-fun lt!192526 () tuple2!10320)

(assert (=> b!122408 (= lt!192515 (bitIndex!0 (size!2450 (buf!2890 (_2!5425 lt!192526))) (currentByte!5587 (_2!5425 lt!192526)) (currentBit!5582 (_2!5425 lt!192526))))))

(assert (=> b!122408 (= lt!192521 (bitIndex!0 (size!2450 (buf!2890 thiss!1305)) (currentByte!5587 thiss!1305) (currentBit!5582 thiss!1305)))))

(declare-datatypes ((tuple2!10326 0))(
  ( (tuple2!10327 (_1!5428 BitStream!4374) (_2!5428 (_ BitVec 64))) )
))
(declare-fun lt!192517 () tuple2!10326)

(declare-fun lt!192513 () tuple2!10326)

(assert (=> b!122408 (and (= (_2!5428 lt!192517) (_2!5428 lt!192513)) (= (_1!5428 lt!192517) (_1!5428 lt!192513)))))

(declare-fun lt!192532 () (_ BitVec 64))

(declare-fun lt!192530 () Unit!7539)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7539)

(assert (=> b!122408 (= lt!192530 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5427 lt!192522) nBits!396 i!615 lt!192532))))

(declare-fun lt!192520 () (_ BitVec 64))

(declare-fun lt!192534 () BitStream!4374)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10326)

(assert (=> b!122408 (= lt!192513 (readNLeastSignificantBitsLoopPure!0 lt!192534 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192520))))

(assert (=> b!122408 (= lt!192534 (withMovedBitIndex!0 (_1!5427 lt!192522) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!122409 () Bool)

(declare-fun e!80205 () Bool)

(assert (=> b!122409 (= e!80205 (not e!80204))))

(declare-fun res!101432 () Bool)

(assert (=> b!122409 (=> res!101432 e!80204)))

(declare-fun lt!192533 () tuple2!10326)

(assert (=> b!122409 (= res!101432 (not (= (_1!5428 lt!192533) (_2!5427 lt!192519))))))

(assert (=> b!122409 (= lt!192533 (readNLeastSignificantBitsLoopPure!0 (_1!5427 lt!192519) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192520))))

(declare-fun lt!192529 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122409 (validate_offset_bits!1 ((_ sign_extend 32) (size!2450 (buf!2890 (_2!5425 lt!192526)))) ((_ sign_extend 32) (currentByte!5587 (_2!5425 lt!192535))) ((_ sign_extend 32) (currentBit!5582 (_2!5425 lt!192535))) lt!192529)))

(declare-fun lt!192539 () Unit!7539)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4374 array!5416 (_ BitVec 64)) Unit!7539)

(assert (=> b!122409 (= lt!192539 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5425 lt!192535) (buf!2890 (_2!5425 lt!192526)) lt!192529))))

(assert (=> b!122409 (= lt!192529 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!192527 () (_ BitVec 64))

(declare-fun lt!192523 () tuple2!10322)

(assert (=> b!122409 (= lt!192520 (bvor lt!192532 (ite (_2!5426 lt!192523) lt!192527 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122409 (= lt!192517 (readNLeastSignificantBitsLoopPure!0 (_1!5427 lt!192522) nBits!396 i!615 lt!192532))))

(declare-fun lt!192525 () (_ BitVec 64))

(assert (=> b!122409 (validate_offset_bits!1 ((_ sign_extend 32) (size!2450 (buf!2890 (_2!5425 lt!192526)))) ((_ sign_extend 32) (currentByte!5587 thiss!1305)) ((_ sign_extend 32) (currentBit!5582 thiss!1305)) lt!192525)))

(declare-fun lt!192537 () Unit!7539)

(assert (=> b!122409 (= lt!192537 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2890 (_2!5425 lt!192526)) lt!192525))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122409 (= lt!192532 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!192516 () Bool)

(assert (=> b!122409 (= (_2!5426 lt!192523) lt!192516)))

(declare-fun readBitPure!0 (BitStream!4374) tuple2!10322)

(assert (=> b!122409 (= lt!192523 (readBitPure!0 (_1!5427 lt!192522)))))

(declare-fun reader!0 (BitStream!4374 BitStream!4374) tuple2!10324)

(assert (=> b!122409 (= lt!192519 (reader!0 (_2!5425 lt!192535) (_2!5425 lt!192526)))))

(assert (=> b!122409 (= lt!192522 (reader!0 thiss!1305 (_2!5425 lt!192526)))))

(assert (=> b!122409 e!80202))

(declare-fun res!101440 () Bool)

(assert (=> b!122409 (=> (not res!101440) (not e!80202))))

(assert (=> b!122409 (= res!101440 (= (bitIndex!0 (size!2450 (buf!2890 (_1!5426 lt!192536))) (currentByte!5587 (_1!5426 lt!192536)) (currentBit!5582 (_1!5426 lt!192536))) (bitIndex!0 (size!2450 (buf!2890 (_1!5426 lt!192518))) (currentByte!5587 (_1!5426 lt!192518)) (currentBit!5582 (_1!5426 lt!192518)))))))

(declare-fun lt!192514 () Unit!7539)

(declare-fun lt!192538 () BitStream!4374)

(declare-fun readBitPrefixLemma!0 (BitStream!4374 BitStream!4374) Unit!7539)

(assert (=> b!122409 (= lt!192514 (readBitPrefixLemma!0 lt!192538 (_2!5425 lt!192526)))))

(assert (=> b!122409 (= lt!192518 (readBitPure!0 (BitStream!4375 (buf!2890 (_2!5425 lt!192526)) (currentByte!5587 thiss!1305) (currentBit!5582 thiss!1305))))))

(assert (=> b!122409 (= lt!192536 (readBitPure!0 lt!192538))))

(assert (=> b!122409 (= lt!192538 (BitStream!4375 (buf!2890 (_2!5425 lt!192535)) (currentByte!5587 thiss!1305) (currentBit!5582 thiss!1305)))))

(declare-fun e!80207 () Bool)

(assert (=> b!122409 e!80207))

(declare-fun res!101436 () Bool)

(assert (=> b!122409 (=> (not res!101436) (not e!80207))))

(assert (=> b!122409 (= res!101436 (isPrefixOf!0 thiss!1305 (_2!5425 lt!192526)))))

(declare-fun lt!192524 () Unit!7539)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4374 BitStream!4374 BitStream!4374) Unit!7539)

(assert (=> b!122409 (= lt!192524 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5425 lt!192535) (_2!5425 lt!192526)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4374 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10320)

(assert (=> b!122409 (= lt!192526 (appendNLeastSignificantBitsLoop!0 (_2!5425 lt!192535) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!80206 () Bool)

(assert (=> b!122409 e!80206))

(declare-fun res!101430 () Bool)

(assert (=> b!122409 (=> (not res!101430) (not e!80206))))

(assert (=> b!122409 (= res!101430 (= (size!2450 (buf!2890 thiss!1305)) (size!2450 (buf!2890 (_2!5425 lt!192535)))))))

(declare-fun appendBit!0 (BitStream!4374 Bool) tuple2!10320)

(assert (=> b!122409 (= lt!192535 (appendBit!0 thiss!1305 lt!192516))))

(assert (=> b!122409 (= lt!192516 (not (= (bvand v!199 lt!192527) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122409 (= lt!192527 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122410 () Bool)

(declare-fun e!80200 () Bool)

(assert (=> b!122410 (= e!80203 e!80200)))

(declare-fun res!101434 () Bool)

(assert (=> b!122410 (=> (not res!101434) (not e!80200))))

(declare-fun lt!192531 () tuple2!10322)

(assert (=> b!122410 (= res!101434 (and (= (_2!5426 lt!192531) lt!192516) (= (_1!5426 lt!192531) (_2!5425 lt!192535))))))

(declare-fun readerFrom!0 (BitStream!4374 (_ BitVec 32) (_ BitVec 32)) BitStream!4374)

(assert (=> b!122410 (= lt!192531 (readBitPure!0 (readerFrom!0 (_2!5425 lt!192535) (currentBit!5582 thiss!1305) (currentByte!5587 thiss!1305))))))

(declare-fun b!122411 () Bool)

(assert (=> b!122411 (= e!80199 (and (= lt!192521 (bvsub lt!192528 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5427 lt!192519) lt!192534)) (and (= (_2!5428 lt!192517) (_2!5428 lt!192533)) (= (_1!5428 lt!192517) (_2!5427 lt!192522))))))))

(declare-fun res!101442 () Bool)

(declare-fun e!80201 () Bool)

(assert (=> start!24166 (=> (not res!101442) (not e!80201))))

(assert (=> start!24166 (= res!101442 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24166 e!80201))

(assert (=> start!24166 true))

(declare-fun e!80198 () Bool)

(declare-fun inv!12 (BitStream!4374) Bool)

(assert (=> start!24166 (and (inv!12 thiss!1305) e!80198)))

(declare-fun b!122412 () Bool)

(declare-fun res!101431 () Bool)

(assert (=> b!122412 (=> (not res!101431) (not e!80207))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122412 (= res!101431 (invariant!0 (currentBit!5582 thiss!1305) (currentByte!5587 thiss!1305) (size!2450 (buf!2890 (_2!5425 lt!192535)))))))

(declare-fun b!122413 () Bool)

(assert (=> b!122413 (= e!80206 e!80203)))

(declare-fun res!101441 () Bool)

(assert (=> b!122413 (=> (not res!101441) (not e!80203))))

(declare-fun lt!192540 () (_ BitVec 64))

(declare-fun lt!192512 () (_ BitVec 64))

(assert (=> b!122413 (= res!101441 (= lt!192540 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!192512)))))

(assert (=> b!122413 (= lt!192540 (bitIndex!0 (size!2450 (buf!2890 (_2!5425 lt!192535))) (currentByte!5587 (_2!5425 lt!192535)) (currentBit!5582 (_2!5425 lt!192535))))))

(assert (=> b!122413 (= lt!192512 (bitIndex!0 (size!2450 (buf!2890 thiss!1305)) (currentByte!5587 thiss!1305) (currentBit!5582 thiss!1305)))))

(declare-fun b!122414 () Bool)

(assert (=> b!122414 (= e!80201 e!80205)))

(declare-fun res!101437 () Bool)

(assert (=> b!122414 (=> (not res!101437) (not e!80205))))

(assert (=> b!122414 (= res!101437 (validate_offset_bits!1 ((_ sign_extend 32) (size!2450 (buf!2890 thiss!1305))) ((_ sign_extend 32) (currentByte!5587 thiss!1305)) ((_ sign_extend 32) (currentBit!5582 thiss!1305)) lt!192525))))

(assert (=> b!122414 (= lt!192525 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122415 () Bool)

(declare-fun array_inv!2252 (array!5416) Bool)

(assert (=> b!122415 (= e!80198 (array_inv!2252 (buf!2890 thiss!1305)))))

(declare-fun b!122416 () Bool)

(assert (=> b!122416 (= e!80207 (invariant!0 (currentBit!5582 thiss!1305) (currentByte!5587 thiss!1305) (size!2450 (buf!2890 (_2!5425 lt!192526)))))))

(declare-fun b!122417 () Bool)

(declare-fun res!101439 () Bool)

(assert (=> b!122417 (=> (not res!101439) (not e!80205))))

(assert (=> b!122417 (= res!101439 (bvslt i!615 nBits!396))))

(declare-fun b!122418 () Bool)

(declare-fun res!101433 () Bool)

(assert (=> b!122418 (=> (not res!101433) (not e!80205))))

(assert (=> b!122418 (= res!101433 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!122419 () Bool)

(assert (=> b!122419 (= e!80200 (= (bitIndex!0 (size!2450 (buf!2890 (_1!5426 lt!192531))) (currentByte!5587 (_1!5426 lt!192531)) (currentBit!5582 (_1!5426 lt!192531))) lt!192540))))

(assert (= (and start!24166 res!101442) b!122414))

(assert (= (and b!122414 res!101437) b!122418))

(assert (= (and b!122418 res!101433) b!122417))

(assert (= (and b!122417 res!101439) b!122409))

(assert (= (and b!122409 res!101430) b!122413))

(assert (= (and b!122413 res!101441) b!122406))

(assert (= (and b!122406 res!101435) b!122410))

(assert (= (and b!122410 res!101434) b!122419))

(assert (= (and b!122409 res!101436) b!122412))

(assert (= (and b!122412 res!101431) b!122416))

(assert (= (and b!122409 res!101440) b!122407))

(assert (= (and b!122409 (not res!101432)) b!122408))

(assert (= (and b!122408 res!101438) b!122411))

(assert (= start!24166 b!122415))

(declare-fun m!185899 () Bool)

(assert (=> b!122408 m!185899))

(declare-fun m!185901 () Bool)

(assert (=> b!122408 m!185901))

(declare-fun m!185903 () Bool)

(assert (=> b!122408 m!185903))

(declare-fun m!185905 () Bool)

(assert (=> b!122408 m!185905))

(declare-fun m!185907 () Bool)

(assert (=> b!122408 m!185907))

(declare-fun m!185909 () Bool)

(assert (=> b!122408 m!185909))

(declare-fun m!185911 () Bool)

(assert (=> b!122408 m!185911))

(declare-fun m!185913 () Bool)

(assert (=> b!122408 m!185913))

(declare-fun m!185915 () Bool)

(assert (=> b!122410 m!185915))

(assert (=> b!122410 m!185915))

(declare-fun m!185917 () Bool)

(assert (=> b!122410 m!185917))

(declare-fun m!185919 () Bool)

(assert (=> b!122418 m!185919))

(declare-fun m!185921 () Bool)

(assert (=> b!122409 m!185921))

(declare-fun m!185923 () Bool)

(assert (=> b!122409 m!185923))

(declare-fun m!185925 () Bool)

(assert (=> b!122409 m!185925))

(declare-fun m!185927 () Bool)

(assert (=> b!122409 m!185927))

(declare-fun m!185929 () Bool)

(assert (=> b!122409 m!185929))

(declare-fun m!185931 () Bool)

(assert (=> b!122409 m!185931))

(declare-fun m!185933 () Bool)

(assert (=> b!122409 m!185933))

(declare-fun m!185935 () Bool)

(assert (=> b!122409 m!185935))

(declare-fun m!185937 () Bool)

(assert (=> b!122409 m!185937))

(declare-fun m!185939 () Bool)

(assert (=> b!122409 m!185939))

(declare-fun m!185941 () Bool)

(assert (=> b!122409 m!185941))

(declare-fun m!185943 () Bool)

(assert (=> b!122409 m!185943))

(declare-fun m!185945 () Bool)

(assert (=> b!122409 m!185945))

(declare-fun m!185947 () Bool)

(assert (=> b!122409 m!185947))

(declare-fun m!185949 () Bool)

(assert (=> b!122409 m!185949))

(declare-fun m!185951 () Bool)

(assert (=> b!122409 m!185951))

(declare-fun m!185953 () Bool)

(assert (=> b!122409 m!185953))

(declare-fun m!185955 () Bool)

(assert (=> b!122409 m!185955))

(declare-fun m!185957 () Bool)

(assert (=> b!122409 m!185957))

(assert (=> b!122413 m!185913))

(assert (=> b!122413 m!185911))

(declare-fun m!185959 () Bool)

(assert (=> b!122416 m!185959))

(declare-fun m!185961 () Bool)

(assert (=> b!122406 m!185961))

(declare-fun m!185963 () Bool)

(assert (=> b!122415 m!185963))

(declare-fun m!185965 () Bool)

(assert (=> b!122412 m!185965))

(declare-fun m!185967 () Bool)

(assert (=> b!122414 m!185967))

(declare-fun m!185969 () Bool)

(assert (=> start!24166 m!185969))

(declare-fun m!185971 () Bool)

(assert (=> b!122419 m!185971))

(check-sat (not b!122415) (not b!122410) (not start!24166) (not b!122419) (not b!122408) (not b!122406) (not b!122416) (not b!122414) (not b!122412) (not b!122413) (not b!122409) (not b!122418))
