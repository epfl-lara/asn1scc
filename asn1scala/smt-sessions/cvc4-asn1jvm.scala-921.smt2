; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25820 () Bool)

(assert start!25820)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun b!132041 () Bool)

(declare-datatypes ((array!6095 0))(
  ( (array!6096 (arr!3389 (Array (_ BitVec 32) (_ BitVec 8))) (size!2760 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6095)

(declare-fun e!87556 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((BitStream!4784 0))(
  ( (BitStream!4785 (buf!3127 array!6095) (currentByte!5906 (_ BitVec 32)) (currentBit!5901 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11450 0))(
  ( (tuple2!11451 (_1!6028 BitStream!4784) (_2!6028 BitStream!4784)) )
))
(declare-fun lt!203618 () tuple2!11450)

(declare-datatypes ((tuple2!11452 0))(
  ( (tuple2!11453 (_1!6029 BitStream!4784) (_2!6029 array!6095)) )
))
(declare-fun readByteArrayLoopPure!0 (BitStream!4784 array!6095 (_ BitVec 32) (_ BitVec 32)) tuple2!11452)

(assert (=> b!132041 (= e!87556 (= (_1!6029 (readByteArrayLoopPure!0 (_1!6028 lt!203618) arr!237 from!447 to!404)) (_2!6028 lt!203618)))))

(declare-fun b!132042 () Bool)

(declare-fun res!109607 () Bool)

(declare-fun e!87553 () Bool)

(assert (=> b!132042 (=> (not res!109607) (not e!87553))))

(declare-fun thiss!1634 () BitStream!4784)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!132042 (= res!109607 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2760 (buf!3127 thiss!1634))) ((_ sign_extend 32) (currentByte!5906 thiss!1634)) ((_ sign_extend 32) (currentBit!5901 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!132043 () Bool)

(declare-fun e!87559 () Bool)

(declare-fun e!87552 () Bool)

(assert (=> b!132043 (= e!87559 (not e!87552))))

(declare-fun res!109602 () Bool)

(assert (=> b!132043 (=> res!109602 e!87552)))

(declare-fun lt!203629 () tuple2!11452)

(declare-fun lt!203636 () tuple2!11450)

(assert (=> b!132043 (= res!109602 (or (not (= (size!2760 (_2!6029 lt!203629)) (size!2760 arr!237))) (not (= (_1!6029 lt!203629) (_2!6028 lt!203636)))))))

(assert (=> b!132043 (= lt!203629 (readByteArrayLoopPure!0 (_1!6028 lt!203636) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8143 0))(
  ( (Unit!8144) )
))
(declare-datatypes ((tuple2!11454 0))(
  ( (tuple2!11455 (_1!6030 Unit!8143) (_2!6030 BitStream!4784)) )
))
(declare-fun lt!203635 () tuple2!11454)

(declare-fun lt!203622 () tuple2!11454)

(declare-fun lt!203633 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132043 (validate_offset_bits!1 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622))) lt!203633)))

(declare-fun lt!203631 () Unit!8143)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4784 array!6095 (_ BitVec 64)) Unit!8143)

(assert (=> b!132043 (= lt!203631 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6030 lt!203622) (buf!3127 (_2!6030 lt!203635)) lt!203633))))

(declare-fun reader!0 (BitStream!4784 BitStream!4784) tuple2!11450)

(assert (=> b!132043 (= lt!203636 (reader!0 (_2!6030 lt!203622) (_2!6030 lt!203635)))))

(declare-fun b!132044 () Bool)

(declare-fun e!87558 () Bool)

(declare-fun array_inv!2549 (array!6095) Bool)

(assert (=> b!132044 (= e!87558 (array_inv!2549 (buf!3127 thiss!1634)))))

(declare-fun b!132045 () Bool)

(declare-fun res!109608 () Bool)

(assert (=> b!132045 (=> (not res!109608) (not e!87559))))

(declare-fun isPrefixOf!0 (BitStream!4784 BitStream!4784) Bool)

(assert (=> b!132045 (= res!109608 (isPrefixOf!0 (_2!6030 lt!203622) (_2!6030 lt!203635)))))

(declare-fun b!132047 () Bool)

(declare-fun res!109599 () Bool)

(declare-fun e!87549 () Bool)

(assert (=> b!132047 (=> (not res!109599) (not e!87549))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!132047 (= res!109599 (= (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203622))) (currentByte!5906 (_2!6030 lt!203622)) (currentBit!5901 (_2!6030 lt!203622))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2760 (buf!3127 thiss!1634)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634)))))))

(declare-fun b!132048 () Bool)

(declare-fun e!87550 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132048 (= e!87550 (invariant!0 (currentBit!5901 thiss!1634) (currentByte!5906 thiss!1634) (size!2760 (buf!3127 (_2!6030 lt!203622)))))))

(declare-fun b!132049 () Bool)

(declare-fun e!87554 () Bool)

(declare-datatypes ((tuple2!11456 0))(
  ( (tuple2!11457 (_1!6031 BitStream!4784) (_2!6031 (_ BitVec 8))) )
))
(declare-fun lt!203620 () tuple2!11456)

(declare-fun lt!203625 () tuple2!11456)

(assert (=> b!132049 (= e!87554 (= (_2!6031 lt!203620) (_2!6031 lt!203625)))))

(declare-fun b!132050 () Bool)

(declare-fun res!109606 () Bool)

(assert (=> b!132050 (=> (not res!109606) (not e!87553))))

(assert (=> b!132050 (= res!109606 (bvslt from!447 to!404))))

(declare-fun b!132051 () Bool)

(declare-fun arrayRangesEq!163 (array!6095 array!6095 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132051 (= e!87552 (not (arrayRangesEq!163 arr!237 (_2!6029 lt!203629) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!203634 () tuple2!11450)

(declare-fun b!132052 () Bool)

(declare-fun lt!203623 () tuple2!11456)

(assert (=> b!132052 (= e!87549 (and (= (_2!6031 lt!203623) (select (arr!3389 arr!237) from!447)) (= (_1!6031 lt!203623) (_2!6028 lt!203634))))))

(declare-fun readBytePure!0 (BitStream!4784) tuple2!11456)

(assert (=> b!132052 (= lt!203623 (readBytePure!0 (_1!6028 lt!203634)))))

(assert (=> b!132052 (= lt!203634 (reader!0 thiss!1634 (_2!6030 lt!203622)))))

(declare-fun b!132053 () Bool)

(declare-fun res!109612 () Bool)

(assert (=> b!132053 (=> (not res!109612) (not e!87553))))

(assert (=> b!132053 (= res!109612 (invariant!0 (currentBit!5901 thiss!1634) (currentByte!5906 thiss!1634) (size!2760 (buf!3127 thiss!1634))))))

(declare-fun b!132054 () Bool)

(declare-fun res!109598 () Bool)

(assert (=> b!132054 (=> (not res!109598) (not e!87549))))

(assert (=> b!132054 (= res!109598 (isPrefixOf!0 thiss!1634 (_2!6030 lt!203622)))))

(declare-fun b!132055 () Bool)

(declare-fun e!87557 () Bool)

(assert (=> b!132055 (= e!87553 (not e!87557))))

(declare-fun res!109610 () Bool)

(assert (=> b!132055 (=> res!109610 e!87557)))

(assert (=> b!132055 (= res!109610 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!203619 () (_ BitVec 32))

(assert (=> b!132055 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622))) lt!203619)))

(declare-fun lt!203628 () Unit!8143)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4784 array!6095 (_ BitVec 32)) Unit!8143)

(assert (=> b!132055 (= lt!203628 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6030 lt!203622) (buf!3127 (_2!6030 lt!203635)) lt!203619))))

(assert (=> b!132055 e!87556))

(declare-fun res!109609 () Bool)

(assert (=> b!132055 (=> (not res!109609) (not e!87556))))

(assert (=> b!132055 (= res!109609 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))) ((_ sign_extend 32) (currentByte!5906 thiss!1634)) ((_ sign_extend 32) (currentBit!5901 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!203627 () Unit!8143)

(assert (=> b!132055 (= lt!203627 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3127 (_2!6030 lt!203635)) (bvsub to!404 from!447)))))

(assert (=> b!132055 (= (_2!6031 (readBytePure!0 (_1!6028 lt!203618))) (select (arr!3389 arr!237) from!447))))

(declare-fun lt!203621 () tuple2!11450)

(assert (=> b!132055 (= lt!203621 (reader!0 (_2!6030 lt!203622) (_2!6030 lt!203635)))))

(assert (=> b!132055 (= lt!203618 (reader!0 thiss!1634 (_2!6030 lt!203635)))))

(assert (=> b!132055 e!87554))

(declare-fun res!109603 () Bool)

(assert (=> b!132055 (=> (not res!109603) (not e!87554))))

(assert (=> b!132055 (= res!109603 (= (bitIndex!0 (size!2760 (buf!3127 (_1!6031 lt!203620))) (currentByte!5906 (_1!6031 lt!203620)) (currentBit!5901 (_1!6031 lt!203620))) (bitIndex!0 (size!2760 (buf!3127 (_1!6031 lt!203625))) (currentByte!5906 (_1!6031 lt!203625)) (currentBit!5901 (_1!6031 lt!203625)))))))

(declare-fun lt!203624 () Unit!8143)

(declare-fun lt!203626 () BitStream!4784)

(declare-fun readBytePrefixLemma!0 (BitStream!4784 BitStream!4784) Unit!8143)

(assert (=> b!132055 (= lt!203624 (readBytePrefixLemma!0 lt!203626 (_2!6030 lt!203635)))))

(assert (=> b!132055 (= lt!203625 (readBytePure!0 (BitStream!4785 (buf!3127 (_2!6030 lt!203635)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634))))))

(assert (=> b!132055 (= lt!203620 (readBytePure!0 lt!203626))))

(assert (=> b!132055 (= lt!203626 (BitStream!4785 (buf!3127 (_2!6030 lt!203622)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634)))))

(assert (=> b!132055 e!87550))

(declare-fun res!109611 () Bool)

(assert (=> b!132055 (=> (not res!109611) (not e!87550))))

(assert (=> b!132055 (= res!109611 (isPrefixOf!0 thiss!1634 (_2!6030 lt!203635)))))

(declare-fun lt!203630 () Unit!8143)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4784 BitStream!4784 BitStream!4784) Unit!8143)

(assert (=> b!132055 (= lt!203630 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6030 lt!203622) (_2!6030 lt!203635)))))

(declare-fun e!87560 () Bool)

(assert (=> b!132055 e!87560))

(declare-fun res!109600 () Bool)

(assert (=> b!132055 (=> (not res!109600) (not e!87560))))

(assert (=> b!132055 (= res!109600 (= (size!2760 (buf!3127 (_2!6030 lt!203622))) (size!2760 (buf!3127 (_2!6030 lt!203635)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4784 array!6095 (_ BitVec 32) (_ BitVec 32)) tuple2!11454)

(assert (=> b!132055 (= lt!203635 (appendByteArrayLoop!0 (_2!6030 lt!203622) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132055 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203622)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622))) lt!203619)))

(assert (=> b!132055 (= lt!203619 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!203632 () Unit!8143)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4784 BitStream!4784 (_ BitVec 64) (_ BitVec 32)) Unit!8143)

(assert (=> b!132055 (= lt!203632 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6030 lt!203622) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!132055 e!87549))

(declare-fun res!109601 () Bool)

(assert (=> b!132055 (=> (not res!109601) (not e!87549))))

(assert (=> b!132055 (= res!109601 (= (size!2760 (buf!3127 thiss!1634)) (size!2760 (buf!3127 (_2!6030 lt!203622)))))))

(declare-fun appendByte!0 (BitStream!4784 (_ BitVec 8)) tuple2!11454)

(assert (=> b!132055 (= lt!203622 (appendByte!0 thiss!1634 (select (arr!3389 arr!237) from!447)))))

(declare-fun b!132056 () Bool)

(assert (=> b!132056 (= e!87557 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_1!6028 lt!203621)))) ((_ sign_extend 32) (currentByte!5906 (_1!6028 lt!203621))) ((_ sign_extend 32) (currentBit!5901 (_1!6028 lt!203621))) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!132046 () Bool)

(assert (=> b!132046 (= e!87560 e!87559)))

(declare-fun res!109605 () Bool)

(assert (=> b!132046 (=> (not res!109605) (not e!87559))))

(assert (=> b!132046 (= res!109605 (= (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203635))) (currentByte!5906 (_2!6030 lt!203635)) (currentBit!5901 (_2!6030 lt!203635))) (bvadd (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203622))) (currentByte!5906 (_2!6030 lt!203622)) (currentBit!5901 (_2!6030 lt!203622))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!203633))))))

(assert (=> b!132046 (= lt!203633 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!109604 () Bool)

(assert (=> start!25820 (=> (not res!109604) (not e!87553))))

(assert (=> start!25820 (= res!109604 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2760 arr!237))))))

(assert (=> start!25820 e!87553))

(assert (=> start!25820 true))

(assert (=> start!25820 (array_inv!2549 arr!237)))

(declare-fun inv!12 (BitStream!4784) Bool)

(assert (=> start!25820 (and (inv!12 thiss!1634) e!87558)))

(assert (= (and start!25820 res!109604) b!132042))

(assert (= (and b!132042 res!109607) b!132050))

(assert (= (and b!132050 res!109606) b!132053))

(assert (= (and b!132053 res!109612) b!132055))

(assert (= (and b!132055 res!109601) b!132047))

(assert (= (and b!132047 res!109599) b!132054))

(assert (= (and b!132054 res!109598) b!132052))

(assert (= (and b!132055 res!109600) b!132046))

(assert (= (and b!132046 res!109605) b!132045))

(assert (= (and b!132045 res!109608) b!132043))

(assert (= (and b!132043 (not res!109602)) b!132051))

(assert (= (and b!132055 res!109611) b!132048))

(assert (= (and b!132055 res!109603) b!132049))

(assert (= (and b!132055 res!109609) b!132041))

(assert (= (and b!132055 (not res!109610)) b!132056))

(assert (= start!25820 b!132044))

(declare-fun m!199347 () Bool)

(assert (=> start!25820 m!199347))

(declare-fun m!199349 () Bool)

(assert (=> start!25820 m!199349))

(declare-fun m!199351 () Bool)

(assert (=> b!132045 m!199351))

(declare-fun m!199353 () Bool)

(assert (=> b!132051 m!199353))

(declare-fun m!199355 () Bool)

(assert (=> b!132047 m!199355))

(declare-fun m!199357 () Bool)

(assert (=> b!132047 m!199357))

(declare-fun m!199359 () Bool)

(assert (=> b!132056 m!199359))

(declare-fun m!199361 () Bool)

(assert (=> b!132044 m!199361))

(declare-fun m!199363 () Bool)

(assert (=> b!132042 m!199363))

(declare-fun m!199365 () Bool)

(assert (=> b!132048 m!199365))

(declare-fun m!199367 () Bool)

(assert (=> b!132043 m!199367))

(declare-fun m!199369 () Bool)

(assert (=> b!132043 m!199369))

(declare-fun m!199371 () Bool)

(assert (=> b!132043 m!199371))

(declare-fun m!199373 () Bool)

(assert (=> b!132043 m!199373))

(declare-fun m!199375 () Bool)

(assert (=> b!132052 m!199375))

(declare-fun m!199377 () Bool)

(assert (=> b!132052 m!199377))

(declare-fun m!199379 () Bool)

(assert (=> b!132052 m!199379))

(declare-fun m!199381 () Bool)

(assert (=> b!132041 m!199381))

(declare-fun m!199383 () Bool)

(assert (=> b!132054 m!199383))

(declare-fun m!199385 () Bool)

(assert (=> b!132046 m!199385))

(assert (=> b!132046 m!199355))

(declare-fun m!199387 () Bool)

(assert (=> b!132053 m!199387))

(declare-fun m!199389 () Bool)

(assert (=> b!132055 m!199389))

(declare-fun m!199391 () Bool)

(assert (=> b!132055 m!199391))

(declare-fun m!199393 () Bool)

(assert (=> b!132055 m!199393))

(declare-fun m!199395 () Bool)

(assert (=> b!132055 m!199395))

(declare-fun m!199397 () Bool)

(assert (=> b!132055 m!199397))

(declare-fun m!199399 () Bool)

(assert (=> b!132055 m!199399))

(declare-fun m!199401 () Bool)

(assert (=> b!132055 m!199401))

(declare-fun m!199403 () Bool)

(assert (=> b!132055 m!199403))

(declare-fun m!199405 () Bool)

(assert (=> b!132055 m!199405))

(declare-fun m!199407 () Bool)

(assert (=> b!132055 m!199407))

(assert (=> b!132055 m!199375))

(declare-fun m!199409 () Bool)

(assert (=> b!132055 m!199409))

(declare-fun m!199411 () Bool)

(assert (=> b!132055 m!199411))

(declare-fun m!199413 () Bool)

(assert (=> b!132055 m!199413))

(declare-fun m!199415 () Bool)

(assert (=> b!132055 m!199415))

(declare-fun m!199417 () Bool)

(assert (=> b!132055 m!199417))

(assert (=> b!132055 m!199373))

(declare-fun m!199419 () Bool)

(assert (=> b!132055 m!199419))

(assert (=> b!132055 m!199375))

(declare-fun m!199421 () Bool)

(assert (=> b!132055 m!199421))

(push 1)

(assert (not start!25820))

(assert (not b!132046))

(assert (not b!132054))

(assert (not b!132055))

(assert (not b!132047))

(assert (not b!132043))

(assert (not b!132044))

(assert (not b!132045))

(assert (not b!132041))

(assert (not b!132042))

(assert (not b!132051))

(assert (not b!132052))

(assert (not b!132056))

(assert (not b!132053))

(assert (not b!132048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41946 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41946 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2760 (buf!3127 thiss!1634))) ((_ sign_extend 32) (currentByte!5906 thiss!1634)) ((_ sign_extend 32) (currentBit!5901 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2760 (buf!3127 thiss!1634))) ((_ sign_extend 32) (currentByte!5906 thiss!1634)) ((_ sign_extend 32) (currentBit!5901 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10250 () Bool)

(assert (= bs!10250 d!41946))

(declare-fun m!199469 () Bool)

(assert (=> bs!10250 m!199469))

(assert (=> b!132042 d!41946))

(declare-fun d!41956 () Bool)

(assert (=> d!41956 (= (invariant!0 (currentBit!5901 thiss!1634) (currentByte!5906 thiss!1634) (size!2760 (buf!3127 thiss!1634))) (and (bvsge (currentBit!5901 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5901 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5906 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5906 thiss!1634) (size!2760 (buf!3127 thiss!1634))) (and (= (currentBit!5901 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5906 thiss!1634) (size!2760 (buf!3127 thiss!1634)))))))))

(assert (=> b!132053 d!41956))

(declare-fun d!41960 () Bool)

(declare-fun res!109635 () Bool)

(declare-fun e!87579 () Bool)

(assert (=> d!41960 (=> res!109635 e!87579)))

(assert (=> d!41960 (= res!109635 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!41960 (= (arrayRangesEq!163 arr!237 (_2!6029 lt!203629) #b00000000000000000000000000000000 to!404) e!87579)))

(declare-fun b!132087 () Bool)

(declare-fun e!87580 () Bool)

(assert (=> b!132087 (= e!87579 e!87580)))

(declare-fun res!109636 () Bool)

(assert (=> b!132087 (=> (not res!109636) (not e!87580))))

(assert (=> b!132087 (= res!109636 (= (select (arr!3389 arr!237) #b00000000000000000000000000000000) (select (arr!3389 (_2!6029 lt!203629)) #b00000000000000000000000000000000)))))

(declare-fun b!132088 () Bool)

(assert (=> b!132088 (= e!87580 (arrayRangesEq!163 arr!237 (_2!6029 lt!203629) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!41960 (not res!109635)) b!132087))

(assert (= (and b!132087 res!109636) b!132088))

(declare-fun m!199499 () Bool)

(assert (=> b!132087 m!199499))

(declare-fun m!199501 () Bool)

(assert (=> b!132087 m!199501))

(declare-fun m!199503 () Bool)

(assert (=> b!132088 m!199503))

(assert (=> b!132051 d!41960))

(declare-datatypes ((tuple3!496 0))(
  ( (tuple3!497 (_1!6033 Unit!8143) (_2!6033 BitStream!4784) (_3!303 array!6095)) )
))
(declare-fun lt!203729 () tuple3!496)

(declare-fun d!41964 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4784 array!6095 (_ BitVec 32) (_ BitVec 32)) tuple3!496)

(assert (=> d!41964 (= lt!203729 (readByteArrayLoop!0 (_1!6028 lt!203618) arr!237 from!447 to!404))))

(assert (=> d!41964 (= (readByteArrayLoopPure!0 (_1!6028 lt!203618) arr!237 from!447 to!404) (tuple2!11453 (_2!6033 lt!203729) (_3!303 lt!203729)))))

(declare-fun bs!10253 () Bool)

(assert (= bs!10253 d!41964))

(declare-fun m!199507 () Bool)

(assert (=> bs!10253 m!199507))

(assert (=> b!132041 d!41964))

(declare-fun d!41968 () Bool)

(declare-datatypes ((tuple2!11460 0))(
  ( (tuple2!11461 (_1!6034 (_ BitVec 8)) (_2!6034 BitStream!4784)) )
))
(declare-fun lt!203732 () tuple2!11460)

(declare-fun readByte!0 (BitStream!4784) tuple2!11460)

(assert (=> d!41968 (= lt!203732 (readByte!0 (_1!6028 lt!203634)))))

(assert (=> d!41968 (= (readBytePure!0 (_1!6028 lt!203634)) (tuple2!11457 (_2!6034 lt!203732) (_1!6034 lt!203732)))))

(declare-fun bs!10254 () Bool)

(assert (= bs!10254 d!41968))

(declare-fun m!199509 () Bool)

(assert (=> bs!10254 m!199509))

(assert (=> b!132052 d!41968))

(declare-fun b!132105 () Bool)

(declare-fun res!109651 () Bool)

(declare-fun e!87588 () Bool)

(assert (=> b!132105 (=> (not res!109651) (not e!87588))))

(declare-fun lt!203798 () tuple2!11450)

(assert (=> b!132105 (= res!109651 (isPrefixOf!0 (_2!6028 lt!203798) (_2!6030 lt!203622)))))

(declare-fun lt!203795 () (_ BitVec 64))

(declare-fun b!132106 () Bool)

(declare-fun lt!203792 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4784 (_ BitVec 64)) BitStream!4784)

(assert (=> b!132106 (= e!87588 (= (_1!6028 lt!203798) (withMovedBitIndex!0 (_2!6028 lt!203798) (bvsub lt!203795 lt!203792))))))

(assert (=> b!132106 (or (= (bvand lt!203795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!203792 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!203795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!203795 lt!203792) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132106 (= lt!203792 (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203622))) (currentByte!5906 (_2!6030 lt!203622)) (currentBit!5901 (_2!6030 lt!203622))))))

(assert (=> b!132106 (= lt!203795 (bitIndex!0 (size!2760 (buf!3127 thiss!1634)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634)))))

(declare-fun d!41970 () Bool)

(assert (=> d!41970 e!87588))

(declare-fun res!109650 () Bool)

(assert (=> d!41970 (=> (not res!109650) (not e!87588))))

(assert (=> d!41970 (= res!109650 (isPrefixOf!0 (_1!6028 lt!203798) (_2!6028 lt!203798)))))

(declare-fun lt!203796 () BitStream!4784)

(assert (=> d!41970 (= lt!203798 (tuple2!11451 lt!203796 (_2!6030 lt!203622)))))

(declare-fun lt!203808 () Unit!8143)

(declare-fun lt!203810 () Unit!8143)

(assert (=> d!41970 (= lt!203808 lt!203810)))

(assert (=> d!41970 (isPrefixOf!0 lt!203796 (_2!6030 lt!203622))))

(assert (=> d!41970 (= lt!203810 (lemmaIsPrefixTransitive!0 lt!203796 (_2!6030 lt!203622) (_2!6030 lt!203622)))))

(declare-fun lt!203807 () Unit!8143)

(declare-fun lt!203799 () Unit!8143)

(assert (=> d!41970 (= lt!203807 lt!203799)))

(assert (=> d!41970 (isPrefixOf!0 lt!203796 (_2!6030 lt!203622))))

(assert (=> d!41970 (= lt!203799 (lemmaIsPrefixTransitive!0 lt!203796 thiss!1634 (_2!6030 lt!203622)))))

(declare-fun lt!203804 () Unit!8143)

(declare-fun e!87589 () Unit!8143)

(assert (=> d!41970 (= lt!203804 e!87589)))

(declare-fun c!7576 () Bool)

(assert (=> d!41970 (= c!7576 (not (= (size!2760 (buf!3127 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!203801 () Unit!8143)

(declare-fun lt!203803 () Unit!8143)

(assert (=> d!41970 (= lt!203801 lt!203803)))

(assert (=> d!41970 (isPrefixOf!0 (_2!6030 lt!203622) (_2!6030 lt!203622))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4784) Unit!8143)

(assert (=> d!41970 (= lt!203803 (lemmaIsPrefixRefl!0 (_2!6030 lt!203622)))))

(declare-fun lt!203805 () Unit!8143)

(declare-fun lt!203794 () Unit!8143)

(assert (=> d!41970 (= lt!203805 lt!203794)))

(assert (=> d!41970 (= lt!203794 (lemmaIsPrefixRefl!0 (_2!6030 lt!203622)))))

(declare-fun lt!203797 () Unit!8143)

(declare-fun lt!203809 () Unit!8143)

(assert (=> d!41970 (= lt!203797 lt!203809)))

(assert (=> d!41970 (isPrefixOf!0 lt!203796 lt!203796)))

(assert (=> d!41970 (= lt!203809 (lemmaIsPrefixRefl!0 lt!203796))))

(declare-fun lt!203793 () Unit!8143)

(declare-fun lt!203802 () Unit!8143)

(assert (=> d!41970 (= lt!203793 lt!203802)))

(assert (=> d!41970 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41970 (= lt!203802 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41970 (= lt!203796 (BitStream!4785 (buf!3127 (_2!6030 lt!203622)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634)))))

(assert (=> d!41970 (isPrefixOf!0 thiss!1634 (_2!6030 lt!203622))))

(assert (=> d!41970 (= (reader!0 thiss!1634 (_2!6030 lt!203622)) lt!203798)))

(declare-fun b!132107 () Bool)

(declare-fun lt!203791 () Unit!8143)

(assert (=> b!132107 (= e!87589 lt!203791)))

(declare-fun lt!203800 () (_ BitVec 64))

(assert (=> b!132107 (= lt!203800 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!203806 () (_ BitVec 64))

(assert (=> b!132107 (= lt!203806 (bitIndex!0 (size!2760 (buf!3127 thiss!1634)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6095 array!6095 (_ BitVec 64) (_ BitVec 64)) Unit!8143)

(assert (=> b!132107 (= lt!203791 (arrayBitRangesEqSymmetric!0 (buf!3127 thiss!1634) (buf!3127 (_2!6030 lt!203622)) lt!203800 lt!203806))))

(declare-fun arrayBitRangesEq!0 (array!6095 array!6095 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132107 (arrayBitRangesEq!0 (buf!3127 (_2!6030 lt!203622)) (buf!3127 thiss!1634) lt!203800 lt!203806)))

(declare-fun b!132108 () Bool)

(declare-fun res!109649 () Bool)

(assert (=> b!132108 (=> (not res!109649) (not e!87588))))

(assert (=> b!132108 (= res!109649 (isPrefixOf!0 (_1!6028 lt!203798) thiss!1634))))

(declare-fun b!132109 () Bool)

(declare-fun Unit!8147 () Unit!8143)

(assert (=> b!132109 (= e!87589 Unit!8147)))

(assert (= (and d!41970 c!7576) b!132107))

(assert (= (and d!41970 (not c!7576)) b!132109))

(assert (= (and d!41970 res!109650) b!132108))

(assert (= (and b!132108 res!109649) b!132105))

(assert (= (and b!132105 res!109651) b!132106))

(declare-fun m!199515 () Bool)

(assert (=> b!132106 m!199515))

(assert (=> b!132106 m!199355))

(assert (=> b!132106 m!199357))

(declare-fun m!199517 () Bool)

(assert (=> d!41970 m!199517))

(declare-fun m!199519 () Bool)

(assert (=> d!41970 m!199519))

(declare-fun m!199521 () Bool)

(assert (=> d!41970 m!199521))

(declare-fun m!199523 () Bool)

(assert (=> d!41970 m!199523))

(declare-fun m!199525 () Bool)

(assert (=> d!41970 m!199525))

(declare-fun m!199527 () Bool)

(assert (=> d!41970 m!199527))

(declare-fun m!199529 () Bool)

(assert (=> d!41970 m!199529))

(assert (=> d!41970 m!199383))

(declare-fun m!199531 () Bool)

(assert (=> d!41970 m!199531))

(declare-fun m!199533 () Bool)

(assert (=> d!41970 m!199533))

(declare-fun m!199535 () Bool)

(assert (=> d!41970 m!199535))

(assert (=> b!132107 m!199357))

(declare-fun m!199537 () Bool)

(assert (=> b!132107 m!199537))

(declare-fun m!199539 () Bool)

(assert (=> b!132107 m!199539))

(declare-fun m!199541 () Bool)

(assert (=> b!132108 m!199541))

(declare-fun m!199543 () Bool)

(assert (=> b!132105 m!199543))

(assert (=> b!132052 d!41970))

(declare-fun d!41974 () Bool)

(declare-fun lt!203811 () tuple2!11460)

(assert (=> d!41974 (= lt!203811 (readByte!0 (BitStream!4785 (buf!3127 (_2!6030 lt!203635)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634))))))

(assert (=> d!41974 (= (readBytePure!0 (BitStream!4785 (buf!3127 (_2!6030 lt!203635)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634))) (tuple2!11457 (_2!6034 lt!203811) (_1!6034 lt!203811)))))

(declare-fun bs!10255 () Bool)

(assert (= bs!10255 d!41974))

(declare-fun m!199545 () Bool)

(assert (=> bs!10255 m!199545))

(assert (=> b!132055 d!41974))

(declare-fun d!41976 () Bool)

(declare-fun e!87592 () Bool)

(assert (=> d!41976 e!87592))

(declare-fun res!109656 () Bool)

(assert (=> d!41976 (=> (not res!109656) (not e!87592))))

(declare-fun lt!203826 () (_ BitVec 64))

(declare-fun lt!203825 () (_ BitVec 64))

(declare-fun lt!203828 () (_ BitVec 64))

(assert (=> d!41976 (= res!109656 (= lt!203826 (bvsub lt!203825 lt!203828)))))

(assert (=> d!41976 (or (= (bvand lt!203825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!203828 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!203825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!203825 lt!203828) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41976 (= lt!203828 (remainingBits!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_1!6031 lt!203625)))) ((_ sign_extend 32) (currentByte!5906 (_1!6031 lt!203625))) ((_ sign_extend 32) (currentBit!5901 (_1!6031 lt!203625)))))))

(declare-fun lt!203827 () (_ BitVec 64))

(declare-fun lt!203824 () (_ BitVec 64))

(assert (=> d!41976 (= lt!203825 (bvmul lt!203827 lt!203824))))

(assert (=> d!41976 (or (= lt!203827 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!203824 (bvsdiv (bvmul lt!203827 lt!203824) lt!203827)))))

(assert (=> d!41976 (= lt!203824 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41976 (= lt!203827 ((_ sign_extend 32) (size!2760 (buf!3127 (_1!6031 lt!203625)))))))

(assert (=> d!41976 (= lt!203826 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5906 (_1!6031 lt!203625))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5901 (_1!6031 lt!203625)))))))

(assert (=> d!41976 (invariant!0 (currentBit!5901 (_1!6031 lt!203625)) (currentByte!5906 (_1!6031 lt!203625)) (size!2760 (buf!3127 (_1!6031 lt!203625))))))

(assert (=> d!41976 (= (bitIndex!0 (size!2760 (buf!3127 (_1!6031 lt!203625))) (currentByte!5906 (_1!6031 lt!203625)) (currentBit!5901 (_1!6031 lt!203625))) lt!203826)))

(declare-fun b!132114 () Bool)

(declare-fun res!109657 () Bool)

(assert (=> b!132114 (=> (not res!109657) (not e!87592))))

(assert (=> b!132114 (= res!109657 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!203826))))

(declare-fun b!132115 () Bool)

(declare-fun lt!203829 () (_ BitVec 64))

(assert (=> b!132115 (= e!87592 (bvsle lt!203826 (bvmul lt!203829 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132115 (or (= lt!203829 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!203829 #b0000000000000000000000000000000000000000000000000000000000001000) lt!203829)))))

(assert (=> b!132115 (= lt!203829 ((_ sign_extend 32) (size!2760 (buf!3127 (_1!6031 lt!203625)))))))

(assert (= (and d!41976 res!109656) b!132114))

(assert (= (and b!132114 res!109657) b!132115))

(declare-fun m!199547 () Bool)

(assert (=> d!41976 m!199547))

(declare-fun m!199549 () Bool)

(assert (=> d!41976 m!199549))

(assert (=> b!132055 d!41976))

(declare-fun d!41978 () Bool)

(assert (=> d!41978 (isPrefixOf!0 thiss!1634 (_2!6030 lt!203635))))

(declare-fun lt!203832 () Unit!8143)

(declare-fun choose!30 (BitStream!4784 BitStream!4784 BitStream!4784) Unit!8143)

(assert (=> d!41978 (= lt!203832 (choose!30 thiss!1634 (_2!6030 lt!203622) (_2!6030 lt!203635)))))

(assert (=> d!41978 (isPrefixOf!0 thiss!1634 (_2!6030 lt!203622))))

(assert (=> d!41978 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6030 lt!203622) (_2!6030 lt!203635)) lt!203832)))

(declare-fun bs!10256 () Bool)

(assert (= bs!10256 d!41978))

(assert (=> bs!10256 m!199405))

(declare-fun m!199551 () Bool)

(assert (=> bs!10256 m!199551))

(assert (=> bs!10256 m!199383))

(assert (=> b!132055 d!41978))

(declare-fun e!87623 () Bool)

(declare-fun lt!203929 () tuple2!11452)

(declare-fun b!132164 () Bool)

(assert (=> b!132164 (= e!87623 (arrayRangesEq!163 arr!237 (_2!6029 lt!203929) #b00000000000000000000000000000000 to!404))))

(declare-fun b!132165 () Bool)

(declare-fun e!87625 () Bool)

(declare-fun lt!203935 () (_ BitVec 64))

(assert (=> b!132165 (= e!87625 (validate_offset_bits!1 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203622)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622))) lt!203935))))

(declare-fun b!132166 () Bool)

(declare-fun res!109707 () Bool)

(declare-fun e!87624 () Bool)

(assert (=> b!132166 (=> (not res!109707) (not e!87624))))

(declare-fun lt!203934 () tuple2!11454)

(assert (=> b!132166 (= res!109707 (isPrefixOf!0 (_2!6030 lt!203622) (_2!6030 lt!203934)))))

(declare-fun b!132167 () Bool)

(assert (=> b!132167 (= e!87624 e!87623)))

(declare-fun res!109706 () Bool)

(assert (=> b!132167 (=> (not res!109706) (not e!87623))))

(declare-fun lt!203933 () tuple2!11450)

(assert (=> b!132167 (= res!109706 (and (= (size!2760 (_2!6029 lt!203929)) (size!2760 arr!237)) (= (_1!6029 lt!203929) (_2!6028 lt!203933))))))

(assert (=> b!132167 (= lt!203929 (readByteArrayLoopPure!0 (_1!6028 lt!203933) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!203927 () Unit!8143)

(declare-fun lt!203930 () Unit!8143)

(assert (=> b!132167 (= lt!203927 lt!203930)))

(assert (=> b!132167 (validate_offset_bits!1 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203934)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622))) lt!203935)))

(assert (=> b!132167 (= lt!203930 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6030 lt!203622) (buf!3127 (_2!6030 lt!203934)) lt!203935))))

(assert (=> b!132167 e!87625))

(declare-fun res!109704 () Bool)

(assert (=> b!132167 (=> (not res!109704) (not e!87625))))

(assert (=> b!132167 (= res!109704 (and (= (size!2760 (buf!3127 (_2!6030 lt!203622))) (size!2760 (buf!3127 (_2!6030 lt!203934)))) (bvsge lt!203935 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132167 (= lt!203935 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!132167 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!132167 (= lt!203933 (reader!0 (_2!6030 lt!203622) (_2!6030 lt!203934)))))

(declare-fun d!41980 () Bool)

(assert (=> d!41980 e!87624))

(declare-fun res!109703 () Bool)

(assert (=> d!41980 (=> (not res!109703) (not e!87624))))

(assert (=> d!41980 (= res!109703 (= (size!2760 (buf!3127 (_2!6030 lt!203622))) (size!2760 (buf!3127 (_2!6030 lt!203934)))))))

(declare-fun choose!64 (BitStream!4784 array!6095 (_ BitVec 32) (_ BitVec 32)) tuple2!11454)

(assert (=> d!41980 (= lt!203934 (choose!64 (_2!6030 lt!203622) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41980 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2760 arr!237)))))

(assert (=> d!41980 (= (appendByteArrayLoop!0 (_2!6030 lt!203622) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!203934)))

(declare-fun b!132163 () Bool)

(declare-fun res!109705 () Bool)

(assert (=> b!132163 (=> (not res!109705) (not e!87624))))

(declare-fun lt!203928 () (_ BitVec 64))

(declare-fun lt!203931 () (_ BitVec 64))

(assert (=> b!132163 (= res!109705 (= (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203934))) (currentByte!5906 (_2!6030 lt!203934)) (currentBit!5901 (_2!6030 lt!203934))) (bvadd lt!203931 lt!203928)))))

(assert (=> b!132163 (or (not (= (bvand lt!203931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!203928 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!203931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!203931 lt!203928) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!203932 () (_ BitVec 64))

(assert (=> b!132163 (= lt!203928 (bvmul lt!203932 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!132163 (or (= lt!203932 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!203932 #b0000000000000000000000000000000000000000000000000000000000001000) lt!203932)))))

(assert (=> b!132163 (= lt!203932 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!132163 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!132163 (= lt!203931 (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203622))) (currentByte!5906 (_2!6030 lt!203622)) (currentBit!5901 (_2!6030 lt!203622))))))

(assert (= (and d!41980 res!109703) b!132163))

(assert (= (and b!132163 res!109705) b!132166))

(assert (= (and b!132166 res!109707) b!132167))

(assert (= (and b!132167 res!109704) b!132165))

(assert (= (and b!132167 res!109706) b!132164))

(declare-fun m!199617 () Bool)

(assert (=> b!132166 m!199617))

(declare-fun m!199619 () Bool)

(assert (=> b!132167 m!199619))

(declare-fun m!199621 () Bool)

(assert (=> b!132167 m!199621))

(declare-fun m!199623 () Bool)

(assert (=> b!132167 m!199623))

(declare-fun m!199625 () Bool)

(assert (=> b!132167 m!199625))

(declare-fun m!199627 () Bool)

(assert (=> b!132165 m!199627))

(declare-fun m!199629 () Bool)

(assert (=> d!41980 m!199629))

(declare-fun m!199631 () Bool)

(assert (=> b!132164 m!199631))

(declare-fun m!199633 () Bool)

(assert (=> b!132163 m!199633))

(assert (=> b!132163 m!199355))

(assert (=> b!132055 d!41980))

(declare-fun d!42001 () Bool)

(declare-fun res!109714 () Bool)

(declare-fun e!87631 () Bool)

(assert (=> d!42001 (=> (not res!109714) (not e!87631))))

(assert (=> d!42001 (= res!109714 (= (size!2760 (buf!3127 thiss!1634)) (size!2760 (buf!3127 (_2!6030 lt!203635)))))))

(assert (=> d!42001 (= (isPrefixOf!0 thiss!1634 (_2!6030 lt!203635)) e!87631)))

(declare-fun b!132174 () Bool)

(declare-fun res!109715 () Bool)

(assert (=> b!132174 (=> (not res!109715) (not e!87631))))

(assert (=> b!132174 (= res!109715 (bvsle (bitIndex!0 (size!2760 (buf!3127 thiss!1634)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634)) (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203635))) (currentByte!5906 (_2!6030 lt!203635)) (currentBit!5901 (_2!6030 lt!203635)))))))

(declare-fun b!132175 () Bool)

(declare-fun e!87630 () Bool)

(assert (=> b!132175 (= e!87631 e!87630)))

(declare-fun res!109716 () Bool)

(assert (=> b!132175 (=> res!109716 e!87630)))

(assert (=> b!132175 (= res!109716 (= (size!2760 (buf!3127 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!132176 () Bool)

(assert (=> b!132176 (= e!87630 (arrayBitRangesEq!0 (buf!3127 thiss!1634) (buf!3127 (_2!6030 lt!203635)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2760 (buf!3127 thiss!1634)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634))))))

(assert (= (and d!42001 res!109714) b!132174))

(assert (= (and b!132174 res!109715) b!132175))

(assert (= (and b!132175 (not res!109716)) b!132176))

(assert (=> b!132174 m!199357))

(assert (=> b!132174 m!199385))

(assert (=> b!132176 m!199357))

(assert (=> b!132176 m!199357))

(declare-fun m!199635 () Bool)

(assert (=> b!132176 m!199635))

(assert (=> b!132055 d!42001))

(declare-fun d!42003 () Bool)

(declare-fun lt!203936 () tuple2!11460)

(assert (=> d!42003 (= lt!203936 (readByte!0 (_1!6028 lt!203618)))))

(assert (=> d!42003 (= (readBytePure!0 (_1!6028 lt!203618)) (tuple2!11457 (_2!6034 lt!203936) (_1!6034 lt!203936)))))

(declare-fun bs!10260 () Bool)

(assert (= bs!10260 d!42003))

(declare-fun m!199637 () Bool)

(assert (=> bs!10260 m!199637))

(assert (=> b!132055 d!42003))

(declare-fun d!42005 () Bool)

(assert (=> d!42005 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))) ((_ sign_extend 32) (currentByte!5906 thiss!1634)) ((_ sign_extend 32) (currentBit!5901 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))) ((_ sign_extend 32) (currentByte!5906 thiss!1634)) ((_ sign_extend 32) (currentBit!5901 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10261 () Bool)

(assert (= bs!10261 d!42005))

(declare-fun m!199639 () Bool)

(assert (=> bs!10261 m!199639))

(assert (=> b!132055 d!42005))

(declare-fun b!132177 () Bool)

(declare-fun res!109719 () Bool)

(declare-fun e!87632 () Bool)

(assert (=> b!132177 (=> (not res!109719) (not e!87632))))

(declare-fun lt!203944 () tuple2!11450)

(assert (=> b!132177 (= res!109719 (isPrefixOf!0 (_2!6028 lt!203944) (_2!6030 lt!203635)))))

(declare-fun b!132178 () Bool)

(declare-fun lt!203938 () (_ BitVec 64))

(declare-fun lt!203941 () (_ BitVec 64))

(assert (=> b!132178 (= e!87632 (= (_1!6028 lt!203944) (withMovedBitIndex!0 (_2!6028 lt!203944) (bvsub lt!203941 lt!203938))))))

(assert (=> b!132178 (or (= (bvand lt!203941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!203938 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!203941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!203941 lt!203938) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132178 (= lt!203938 (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203635))) (currentByte!5906 (_2!6030 lt!203635)) (currentBit!5901 (_2!6030 lt!203635))))))

(assert (=> b!132178 (= lt!203941 (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203622))) (currentByte!5906 (_2!6030 lt!203622)) (currentBit!5901 (_2!6030 lt!203622))))))

(declare-fun d!42007 () Bool)

(assert (=> d!42007 e!87632))

(declare-fun res!109718 () Bool)

(assert (=> d!42007 (=> (not res!109718) (not e!87632))))

(assert (=> d!42007 (= res!109718 (isPrefixOf!0 (_1!6028 lt!203944) (_2!6028 lt!203944)))))

(declare-fun lt!203942 () BitStream!4784)

(assert (=> d!42007 (= lt!203944 (tuple2!11451 lt!203942 (_2!6030 lt!203635)))))

(declare-fun lt!203954 () Unit!8143)

(declare-fun lt!203956 () Unit!8143)

(assert (=> d!42007 (= lt!203954 lt!203956)))

(assert (=> d!42007 (isPrefixOf!0 lt!203942 (_2!6030 lt!203635))))

(assert (=> d!42007 (= lt!203956 (lemmaIsPrefixTransitive!0 lt!203942 (_2!6030 lt!203635) (_2!6030 lt!203635)))))

(declare-fun lt!203953 () Unit!8143)

(declare-fun lt!203945 () Unit!8143)

(assert (=> d!42007 (= lt!203953 lt!203945)))

(assert (=> d!42007 (isPrefixOf!0 lt!203942 (_2!6030 lt!203635))))

(assert (=> d!42007 (= lt!203945 (lemmaIsPrefixTransitive!0 lt!203942 (_2!6030 lt!203622) (_2!6030 lt!203635)))))

(declare-fun lt!203950 () Unit!8143)

(declare-fun e!87633 () Unit!8143)

(assert (=> d!42007 (= lt!203950 e!87633)))

(declare-fun c!7578 () Bool)

(assert (=> d!42007 (= c!7578 (not (= (size!2760 (buf!3127 (_2!6030 lt!203622))) #b00000000000000000000000000000000)))))

(declare-fun lt!203947 () Unit!8143)

(declare-fun lt!203949 () Unit!8143)

(assert (=> d!42007 (= lt!203947 lt!203949)))

(assert (=> d!42007 (isPrefixOf!0 (_2!6030 lt!203635) (_2!6030 lt!203635))))

(assert (=> d!42007 (= lt!203949 (lemmaIsPrefixRefl!0 (_2!6030 lt!203635)))))

(declare-fun lt!203951 () Unit!8143)

(declare-fun lt!203940 () Unit!8143)

(assert (=> d!42007 (= lt!203951 lt!203940)))

(assert (=> d!42007 (= lt!203940 (lemmaIsPrefixRefl!0 (_2!6030 lt!203635)))))

(declare-fun lt!203943 () Unit!8143)

(declare-fun lt!203955 () Unit!8143)

(assert (=> d!42007 (= lt!203943 lt!203955)))

(assert (=> d!42007 (isPrefixOf!0 lt!203942 lt!203942)))

(assert (=> d!42007 (= lt!203955 (lemmaIsPrefixRefl!0 lt!203942))))

(declare-fun lt!203939 () Unit!8143)

(declare-fun lt!203948 () Unit!8143)

(assert (=> d!42007 (= lt!203939 lt!203948)))

(assert (=> d!42007 (isPrefixOf!0 (_2!6030 lt!203622) (_2!6030 lt!203622))))

(assert (=> d!42007 (= lt!203948 (lemmaIsPrefixRefl!0 (_2!6030 lt!203622)))))

(assert (=> d!42007 (= lt!203942 (BitStream!4785 (buf!3127 (_2!6030 lt!203635)) (currentByte!5906 (_2!6030 lt!203622)) (currentBit!5901 (_2!6030 lt!203622))))))

(assert (=> d!42007 (isPrefixOf!0 (_2!6030 lt!203622) (_2!6030 lt!203635))))

(assert (=> d!42007 (= (reader!0 (_2!6030 lt!203622) (_2!6030 lt!203635)) lt!203944)))

(declare-fun b!132179 () Bool)

(declare-fun lt!203937 () Unit!8143)

(assert (=> b!132179 (= e!87633 lt!203937)))

(declare-fun lt!203946 () (_ BitVec 64))

(assert (=> b!132179 (= lt!203946 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!203952 () (_ BitVec 64))

(assert (=> b!132179 (= lt!203952 (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203622))) (currentByte!5906 (_2!6030 lt!203622)) (currentBit!5901 (_2!6030 lt!203622))))))

(assert (=> b!132179 (= lt!203937 (arrayBitRangesEqSymmetric!0 (buf!3127 (_2!6030 lt!203622)) (buf!3127 (_2!6030 lt!203635)) lt!203946 lt!203952))))

(assert (=> b!132179 (arrayBitRangesEq!0 (buf!3127 (_2!6030 lt!203635)) (buf!3127 (_2!6030 lt!203622)) lt!203946 lt!203952)))

(declare-fun b!132180 () Bool)

(declare-fun res!109717 () Bool)

(assert (=> b!132180 (=> (not res!109717) (not e!87632))))

(assert (=> b!132180 (= res!109717 (isPrefixOf!0 (_1!6028 lt!203944) (_2!6030 lt!203622)))))

(declare-fun b!132181 () Bool)

(declare-fun Unit!8149 () Unit!8143)

(assert (=> b!132181 (= e!87633 Unit!8149)))

(assert (= (and d!42007 c!7578) b!132179))

(assert (= (and d!42007 (not c!7578)) b!132181))

(assert (= (and d!42007 res!109718) b!132180))

(assert (= (and b!132180 res!109717) b!132177))

(assert (= (and b!132177 res!109719) b!132178))

(declare-fun m!199641 () Bool)

(assert (=> b!132178 m!199641))

(assert (=> b!132178 m!199385))

(assert (=> b!132178 m!199355))

(declare-fun m!199643 () Bool)

(assert (=> d!42007 m!199643))

(assert (=> d!42007 m!199529))

(declare-fun m!199645 () Bool)

(assert (=> d!42007 m!199645))

(declare-fun m!199647 () Bool)

(assert (=> d!42007 m!199647))

(declare-fun m!199649 () Bool)

(assert (=> d!42007 m!199649))

(declare-fun m!199651 () Bool)

(assert (=> d!42007 m!199651))

(declare-fun m!199653 () Bool)

(assert (=> d!42007 m!199653))

(assert (=> d!42007 m!199351))

(assert (=> d!42007 m!199523))

(declare-fun m!199655 () Bool)

(assert (=> d!42007 m!199655))

(declare-fun m!199657 () Bool)

(assert (=> d!42007 m!199657))

(assert (=> b!132179 m!199355))

(declare-fun m!199659 () Bool)

(assert (=> b!132179 m!199659))

(declare-fun m!199661 () Bool)

(assert (=> b!132179 m!199661))

(declare-fun m!199663 () Bool)

(assert (=> b!132180 m!199663))

(declare-fun m!199665 () Bool)

(assert (=> b!132177 m!199665))

(assert (=> b!132055 d!42007))

(declare-fun d!42009 () Bool)

(assert (=> d!42009 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622))) lt!203619) (bvsle ((_ sign_extend 32) lt!203619) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10262 () Bool)

(assert (= bs!10262 d!42009))

(declare-fun m!199667 () Bool)

(assert (=> bs!10262 m!199667))

(assert (=> b!132055 d!42009))

(declare-fun d!42011 () Bool)

(assert (=> d!42011 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))) ((_ sign_extend 32) (currentByte!5906 thiss!1634)) ((_ sign_extend 32) (currentBit!5901 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!203959 () Unit!8143)

(declare-fun choose!26 (BitStream!4784 array!6095 (_ BitVec 32) BitStream!4784) Unit!8143)

(assert (=> d!42011 (= lt!203959 (choose!26 thiss!1634 (buf!3127 (_2!6030 lt!203635)) (bvsub to!404 from!447) (BitStream!4785 (buf!3127 (_2!6030 lt!203635)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634))))))

(assert (=> d!42011 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3127 (_2!6030 lt!203635)) (bvsub to!404 from!447)) lt!203959)))

(declare-fun bs!10263 () Bool)

(assert (= bs!10263 d!42011))

(assert (=> bs!10263 m!199403))

(declare-fun m!199669 () Bool)

(assert (=> bs!10263 m!199669))

(assert (=> b!132055 d!42011))

(declare-fun d!42013 () Bool)

(declare-fun lt!203960 () tuple2!11460)

(assert (=> d!42013 (= lt!203960 (readByte!0 lt!203626))))

(assert (=> d!42013 (= (readBytePure!0 lt!203626) (tuple2!11457 (_2!6034 lt!203960) (_1!6034 lt!203960)))))

(declare-fun bs!10264 () Bool)

(assert (= bs!10264 d!42013))

(declare-fun m!199671 () Bool)

(assert (=> bs!10264 m!199671))

(assert (=> b!132055 d!42013))

(declare-fun d!42015 () Bool)

(declare-fun e!87638 () Bool)

(assert (=> d!42015 e!87638))

(declare-fun res!109728 () Bool)

(assert (=> d!42015 (=> (not res!109728) (not e!87638))))

(declare-fun lt!203981 () tuple2!11456)

(declare-fun lt!203982 () tuple2!11456)

(assert (=> d!42015 (= res!109728 (= (bitIndex!0 (size!2760 (buf!3127 (_1!6031 lt!203981))) (currentByte!5906 (_1!6031 lt!203981)) (currentBit!5901 (_1!6031 lt!203981))) (bitIndex!0 (size!2760 (buf!3127 (_1!6031 lt!203982))) (currentByte!5906 (_1!6031 lt!203982)) (currentBit!5901 (_1!6031 lt!203982)))))))

(declare-fun lt!203979 () BitStream!4784)

(declare-fun lt!203980 () Unit!8143)

(declare-fun choose!14 (BitStream!4784 BitStream!4784 BitStream!4784 tuple2!11456 tuple2!11456 BitStream!4784 (_ BitVec 8) tuple2!11456 tuple2!11456 BitStream!4784 (_ BitVec 8)) Unit!8143)

(assert (=> d!42015 (= lt!203980 (choose!14 lt!203626 (_2!6030 lt!203635) lt!203979 lt!203981 (tuple2!11457 (_1!6031 lt!203981) (_2!6031 lt!203981)) (_1!6031 lt!203981) (_2!6031 lt!203981) lt!203982 (tuple2!11457 (_1!6031 lt!203982) (_2!6031 lt!203982)) (_1!6031 lt!203982) (_2!6031 lt!203982)))))

(assert (=> d!42015 (= lt!203982 (readBytePure!0 lt!203979))))

(assert (=> d!42015 (= lt!203981 (readBytePure!0 lt!203626))))

(assert (=> d!42015 (= lt!203979 (BitStream!4785 (buf!3127 (_2!6030 lt!203635)) (currentByte!5906 lt!203626) (currentBit!5901 lt!203626)))))

(assert (=> d!42015 (= (readBytePrefixLemma!0 lt!203626 (_2!6030 lt!203635)) lt!203980)))

(declare-fun b!132190 () Bool)

(assert (=> b!132190 (= e!87638 (= (_2!6031 lt!203981) (_2!6031 lt!203982)))))

(assert (= (and d!42015 res!109728) b!132190))

(assert (=> d!42015 m!199401))

(declare-fun m!199673 () Bool)

(assert (=> d!42015 m!199673))

(declare-fun m!199675 () Bool)

(assert (=> d!42015 m!199675))

(declare-fun m!199677 () Bool)

(assert (=> d!42015 m!199677))

(declare-fun m!199679 () Bool)

(assert (=> d!42015 m!199679))

(assert (=> b!132055 d!42015))

(declare-fun b!132191 () Bool)

(declare-fun res!109731 () Bool)

(declare-fun e!87639 () Bool)

(assert (=> b!132191 (=> (not res!109731) (not e!87639))))

(declare-fun lt!203990 () tuple2!11450)

(assert (=> b!132191 (= res!109731 (isPrefixOf!0 (_2!6028 lt!203990) (_2!6030 lt!203635)))))

(declare-fun lt!203987 () (_ BitVec 64))

(declare-fun lt!203984 () (_ BitVec 64))

(declare-fun b!132192 () Bool)

(assert (=> b!132192 (= e!87639 (= (_1!6028 lt!203990) (withMovedBitIndex!0 (_2!6028 lt!203990) (bvsub lt!203987 lt!203984))))))

(assert (=> b!132192 (or (= (bvand lt!203987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!203984 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!203987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!203987 lt!203984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132192 (= lt!203984 (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203635))) (currentByte!5906 (_2!6030 lt!203635)) (currentBit!5901 (_2!6030 lt!203635))))))

(assert (=> b!132192 (= lt!203987 (bitIndex!0 (size!2760 (buf!3127 thiss!1634)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634)))))

(declare-fun d!42017 () Bool)

(assert (=> d!42017 e!87639))

(declare-fun res!109730 () Bool)

(assert (=> d!42017 (=> (not res!109730) (not e!87639))))

(assert (=> d!42017 (= res!109730 (isPrefixOf!0 (_1!6028 lt!203990) (_2!6028 lt!203990)))))

(declare-fun lt!203988 () BitStream!4784)

(assert (=> d!42017 (= lt!203990 (tuple2!11451 lt!203988 (_2!6030 lt!203635)))))

(declare-fun lt!204000 () Unit!8143)

(declare-fun lt!204002 () Unit!8143)

(assert (=> d!42017 (= lt!204000 lt!204002)))

(assert (=> d!42017 (isPrefixOf!0 lt!203988 (_2!6030 lt!203635))))

(assert (=> d!42017 (= lt!204002 (lemmaIsPrefixTransitive!0 lt!203988 (_2!6030 lt!203635) (_2!6030 lt!203635)))))

(declare-fun lt!203999 () Unit!8143)

(declare-fun lt!203991 () Unit!8143)

(assert (=> d!42017 (= lt!203999 lt!203991)))

(assert (=> d!42017 (isPrefixOf!0 lt!203988 (_2!6030 lt!203635))))

(assert (=> d!42017 (= lt!203991 (lemmaIsPrefixTransitive!0 lt!203988 thiss!1634 (_2!6030 lt!203635)))))

(declare-fun lt!203996 () Unit!8143)

(declare-fun e!87640 () Unit!8143)

(assert (=> d!42017 (= lt!203996 e!87640)))

(declare-fun c!7579 () Bool)

(assert (=> d!42017 (= c!7579 (not (= (size!2760 (buf!3127 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!203993 () Unit!8143)

(declare-fun lt!203995 () Unit!8143)

(assert (=> d!42017 (= lt!203993 lt!203995)))

(assert (=> d!42017 (isPrefixOf!0 (_2!6030 lt!203635) (_2!6030 lt!203635))))

(assert (=> d!42017 (= lt!203995 (lemmaIsPrefixRefl!0 (_2!6030 lt!203635)))))

(declare-fun lt!203997 () Unit!8143)

(declare-fun lt!203986 () Unit!8143)

(assert (=> d!42017 (= lt!203997 lt!203986)))

(assert (=> d!42017 (= lt!203986 (lemmaIsPrefixRefl!0 (_2!6030 lt!203635)))))

(declare-fun lt!203989 () Unit!8143)

(declare-fun lt!204001 () Unit!8143)

(assert (=> d!42017 (= lt!203989 lt!204001)))

(assert (=> d!42017 (isPrefixOf!0 lt!203988 lt!203988)))

(assert (=> d!42017 (= lt!204001 (lemmaIsPrefixRefl!0 lt!203988))))

(declare-fun lt!203985 () Unit!8143)

(declare-fun lt!203994 () Unit!8143)

(assert (=> d!42017 (= lt!203985 lt!203994)))

(assert (=> d!42017 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42017 (= lt!203994 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42017 (= lt!203988 (BitStream!4785 (buf!3127 (_2!6030 lt!203635)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634)))))

(assert (=> d!42017 (isPrefixOf!0 thiss!1634 (_2!6030 lt!203635))))

(assert (=> d!42017 (= (reader!0 thiss!1634 (_2!6030 lt!203635)) lt!203990)))

(declare-fun b!132193 () Bool)

(declare-fun lt!203983 () Unit!8143)

(assert (=> b!132193 (= e!87640 lt!203983)))

(declare-fun lt!203992 () (_ BitVec 64))

(assert (=> b!132193 (= lt!203992 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!203998 () (_ BitVec 64))

(assert (=> b!132193 (= lt!203998 (bitIndex!0 (size!2760 (buf!3127 thiss!1634)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634)))))

(assert (=> b!132193 (= lt!203983 (arrayBitRangesEqSymmetric!0 (buf!3127 thiss!1634) (buf!3127 (_2!6030 lt!203635)) lt!203992 lt!203998))))

(assert (=> b!132193 (arrayBitRangesEq!0 (buf!3127 (_2!6030 lt!203635)) (buf!3127 thiss!1634) lt!203992 lt!203998)))

(declare-fun b!132194 () Bool)

(declare-fun res!109729 () Bool)

(assert (=> b!132194 (=> (not res!109729) (not e!87639))))

(assert (=> b!132194 (= res!109729 (isPrefixOf!0 (_1!6028 lt!203990) thiss!1634))))

(declare-fun b!132195 () Bool)

(declare-fun Unit!8150 () Unit!8143)

(assert (=> b!132195 (= e!87640 Unit!8150)))

(assert (= (and d!42017 c!7579) b!132193))

(assert (= (and d!42017 (not c!7579)) b!132195))

(assert (= (and d!42017 res!109730) b!132194))

(assert (= (and b!132194 res!109729) b!132191))

(assert (= (and b!132191 res!109731) b!132192))

(declare-fun m!199683 () Bool)

(assert (=> b!132192 m!199683))

(assert (=> b!132192 m!199385))

(assert (=> b!132192 m!199357))

(declare-fun m!199689 () Bool)

(assert (=> d!42017 m!199689))

(assert (=> d!42017 m!199519))

(declare-fun m!199693 () Bool)

(assert (=> d!42017 m!199693))

(assert (=> d!42017 m!199647))

(declare-fun m!199697 () Bool)

(assert (=> d!42017 m!199697))

(declare-fun m!199701 () Bool)

(assert (=> d!42017 m!199701))

(assert (=> d!42017 m!199653))

(assert (=> d!42017 m!199405))

(assert (=> d!42017 m!199531))

(declare-fun m!199703 () Bool)

(assert (=> d!42017 m!199703))

(declare-fun m!199705 () Bool)

(assert (=> d!42017 m!199705))

(assert (=> b!132193 m!199357))

(declare-fun m!199709 () Bool)

(assert (=> b!132193 m!199709))

(declare-fun m!199711 () Bool)

(assert (=> b!132193 m!199711))

(declare-fun m!199713 () Bool)

(assert (=> b!132194 m!199713))

(declare-fun m!199715 () Bool)

(assert (=> b!132191 m!199715))

(assert (=> b!132055 d!42017))

(declare-fun d!42023 () Bool)

(declare-fun e!87642 () Bool)

(assert (=> d!42023 e!87642))

(declare-fun res!109735 () Bool)

(assert (=> d!42023 (=> (not res!109735) (not e!87642))))

(declare-fun lt!204010 () (_ BitVec 64))

(declare-fun lt!204011 () (_ BitVec 64))

(declare-fun lt!204013 () (_ BitVec 64))

(assert (=> d!42023 (= res!109735 (= lt!204011 (bvsub lt!204010 lt!204013)))))

(assert (=> d!42023 (or (= (bvand lt!204010 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204010 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204010 lt!204013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42023 (= lt!204013 (remainingBits!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_1!6031 lt!203620)))) ((_ sign_extend 32) (currentByte!5906 (_1!6031 lt!203620))) ((_ sign_extend 32) (currentBit!5901 (_1!6031 lt!203620)))))))

(declare-fun lt!204012 () (_ BitVec 64))

(declare-fun lt!204009 () (_ BitVec 64))

(assert (=> d!42023 (= lt!204010 (bvmul lt!204012 lt!204009))))

(assert (=> d!42023 (or (= lt!204012 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!204009 (bvsdiv (bvmul lt!204012 lt!204009) lt!204012)))))

(assert (=> d!42023 (= lt!204009 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42023 (= lt!204012 ((_ sign_extend 32) (size!2760 (buf!3127 (_1!6031 lt!203620)))))))

(assert (=> d!42023 (= lt!204011 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5906 (_1!6031 lt!203620))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5901 (_1!6031 lt!203620)))))))

(assert (=> d!42023 (invariant!0 (currentBit!5901 (_1!6031 lt!203620)) (currentByte!5906 (_1!6031 lt!203620)) (size!2760 (buf!3127 (_1!6031 lt!203620))))))

(assert (=> d!42023 (= (bitIndex!0 (size!2760 (buf!3127 (_1!6031 lt!203620))) (currentByte!5906 (_1!6031 lt!203620)) (currentBit!5901 (_1!6031 lt!203620))) lt!204011)))

(declare-fun b!132199 () Bool)

(declare-fun res!109736 () Bool)

(assert (=> b!132199 (=> (not res!109736) (not e!87642))))

(assert (=> b!132199 (= res!109736 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!204011))))

(declare-fun b!132200 () Bool)

(declare-fun lt!204014 () (_ BitVec 64))

(assert (=> b!132200 (= e!87642 (bvsle lt!204011 (bvmul lt!204014 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132200 (or (= lt!204014 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!204014 #b0000000000000000000000000000000000000000000000000000000000001000) lt!204014)))))

(assert (=> b!132200 (= lt!204014 ((_ sign_extend 32) (size!2760 (buf!3127 (_1!6031 lt!203620)))))))

(assert (= (and d!42023 res!109735) b!132199))

(assert (= (and b!132199 res!109736) b!132200))

(declare-fun m!199717 () Bool)

(assert (=> d!42023 m!199717))

(declare-fun m!199719 () Bool)

(assert (=> d!42023 m!199719))

(assert (=> b!132055 d!42023))

(declare-fun d!42027 () Bool)

(declare-fun e!87651 () Bool)

(assert (=> d!42027 e!87651))

(declare-fun res!109749 () Bool)

(assert (=> d!42027 (=> (not res!109749) (not e!87651))))

(assert (=> d!42027 (= res!109749 (and (or (let ((rhs!3091 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3091 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3091) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!42032 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!42032 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!42032 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3090 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3090 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3090) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!204041 () Unit!8143)

(declare-fun choose!57 (BitStream!4784 BitStream!4784 (_ BitVec 64) (_ BitVec 32)) Unit!8143)

(assert (=> d!42027 (= lt!204041 (choose!57 thiss!1634 (_2!6030 lt!203622) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!42027 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6030 lt!203622) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!204041)))

(declare-fun b!132213 () Bool)

(declare-fun lt!204042 () (_ BitVec 32))

(assert (=> b!132213 (= e!87651 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203622)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622))) (bvsub (bvsub to!404 from!447) lt!204042)))))

(assert (=> b!132213 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!204042 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!204042) #b10000000000000000000000000000000)))))

(declare-fun lt!204040 () (_ BitVec 64))

(assert (=> b!132213 (= lt!204042 ((_ extract 31 0) lt!204040))))

(assert (=> b!132213 (and (bvslt lt!204040 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!204040 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!132213 (= lt!204040 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!42027 res!109749) b!132213))

(declare-fun m!199739 () Bool)

(assert (=> d!42027 m!199739))

(declare-fun m!199741 () Bool)

(assert (=> b!132213 m!199741))

(assert (=> b!132055 d!42027))

(declare-fun d!42048 () Bool)

(assert (=> d!42048 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203622)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622))) lt!203619) (bvsle ((_ sign_extend 32) lt!203619) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203622)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10271 () Bool)

(assert (= bs!10271 d!42048))

(declare-fun m!199743 () Bool)

(assert (=> bs!10271 m!199743))

(assert (=> b!132055 d!42048))

(declare-fun d!42050 () Bool)

(assert (=> d!42050 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622))) lt!203619)))

(declare-fun lt!204049 () Unit!8143)

(assert (=> d!42050 (= lt!204049 (choose!26 (_2!6030 lt!203622) (buf!3127 (_2!6030 lt!203635)) lt!203619 (BitStream!4785 (buf!3127 (_2!6030 lt!203635)) (currentByte!5906 (_2!6030 lt!203622)) (currentBit!5901 (_2!6030 lt!203622)))))))

(assert (=> d!42050 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6030 lt!203622) (buf!3127 (_2!6030 lt!203635)) lt!203619) lt!204049)))

(declare-fun bs!10272 () Bool)

(assert (= bs!10272 d!42050))

(assert (=> bs!10272 m!199389))

(declare-fun m!199745 () Bool)

(assert (=> bs!10272 m!199745))

(assert (=> b!132055 d!42050))

(declare-fun d!42056 () Bool)

(declare-fun e!87655 () Bool)

(assert (=> d!42056 e!87655))

(declare-fun res!109760 () Bool)

(assert (=> d!42056 (=> (not res!109760) (not e!87655))))

(declare-fun lt!204062 () tuple2!11454)

(assert (=> d!42056 (= res!109760 (= (size!2760 (buf!3127 thiss!1634)) (size!2760 (buf!3127 (_2!6030 lt!204062)))))))

(declare-fun choose!6 (BitStream!4784 (_ BitVec 8)) tuple2!11454)

(assert (=> d!42056 (= lt!204062 (choose!6 thiss!1634 (select (arr!3389 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!42056 (validate_offset_byte!0 ((_ sign_extend 32) (size!2760 (buf!3127 thiss!1634))) ((_ sign_extend 32) (currentByte!5906 thiss!1634)) ((_ sign_extend 32) (currentBit!5901 thiss!1634)))))

(assert (=> d!42056 (= (appendByte!0 thiss!1634 (select (arr!3389 arr!237) from!447)) lt!204062)))

(declare-fun b!132222 () Bool)

(declare-fun res!109759 () Bool)

(assert (=> b!132222 (=> (not res!109759) (not e!87655))))

(declare-fun lt!204060 () (_ BitVec 64))

(declare-fun lt!204063 () (_ BitVec 64))

(assert (=> b!132222 (= res!109759 (= (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!204062))) (currentByte!5906 (_2!6030 lt!204062)) (currentBit!5901 (_2!6030 lt!204062))) (bvadd lt!204063 lt!204060)))))

(assert (=> b!132222 (or (not (= (bvand lt!204063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204060 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!204063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!204063 lt!204060) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132222 (= lt!204060 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!132222 (= lt!204063 (bitIndex!0 (size!2760 (buf!3127 thiss!1634)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634)))))

(declare-fun b!132223 () Bool)

(declare-fun res!109758 () Bool)

(assert (=> b!132223 (=> (not res!109758) (not e!87655))))

(assert (=> b!132223 (= res!109758 (isPrefixOf!0 thiss!1634 (_2!6030 lt!204062)))))

(declare-fun b!132224 () Bool)

(declare-fun lt!204061 () tuple2!11450)

(declare-fun lt!204064 () tuple2!11456)

(assert (=> b!132224 (= e!87655 (and (= (_2!6031 lt!204064) (select (arr!3389 arr!237) from!447)) (= (_1!6031 lt!204064) (_2!6028 lt!204061))))))

(assert (=> b!132224 (= lt!204064 (readBytePure!0 (_1!6028 lt!204061)))))

(assert (=> b!132224 (= lt!204061 (reader!0 thiss!1634 (_2!6030 lt!204062)))))

(assert (= (and d!42056 res!109760) b!132222))

(assert (= (and b!132222 res!109759) b!132223))

(assert (= (and b!132223 res!109758) b!132224))

(assert (=> d!42056 m!199375))

(declare-fun m!199747 () Bool)

(assert (=> d!42056 m!199747))

(declare-fun m!199749 () Bool)

(assert (=> d!42056 m!199749))

(declare-fun m!199751 () Bool)

(assert (=> b!132222 m!199751))

(assert (=> b!132222 m!199357))

(declare-fun m!199753 () Bool)

(assert (=> b!132223 m!199753))

(declare-fun m!199755 () Bool)

(assert (=> b!132224 m!199755))

(declare-fun m!199757 () Bool)

(assert (=> b!132224 m!199757))

(assert (=> b!132055 d!42056))

(declare-fun d!42058 () Bool)

(declare-fun res!109761 () Bool)

(declare-fun e!87657 () Bool)

(assert (=> d!42058 (=> (not res!109761) (not e!87657))))

(assert (=> d!42058 (= res!109761 (= (size!2760 (buf!3127 (_2!6030 lt!203622))) (size!2760 (buf!3127 (_2!6030 lt!203635)))))))

(assert (=> d!42058 (= (isPrefixOf!0 (_2!6030 lt!203622) (_2!6030 lt!203635)) e!87657)))

(declare-fun b!132225 () Bool)

(declare-fun res!109762 () Bool)

(assert (=> b!132225 (=> (not res!109762) (not e!87657))))

(assert (=> b!132225 (= res!109762 (bvsle (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203622))) (currentByte!5906 (_2!6030 lt!203622)) (currentBit!5901 (_2!6030 lt!203622))) (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203635))) (currentByte!5906 (_2!6030 lt!203635)) (currentBit!5901 (_2!6030 lt!203635)))))))

(declare-fun b!132226 () Bool)

(declare-fun e!87656 () Bool)

(assert (=> b!132226 (= e!87657 e!87656)))

(declare-fun res!109763 () Bool)

(assert (=> b!132226 (=> res!109763 e!87656)))

(assert (=> b!132226 (= res!109763 (= (size!2760 (buf!3127 (_2!6030 lt!203622))) #b00000000000000000000000000000000))))

(declare-fun b!132227 () Bool)

(assert (=> b!132227 (= e!87656 (arrayBitRangesEq!0 (buf!3127 (_2!6030 lt!203622)) (buf!3127 (_2!6030 lt!203635)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203622))) (currentByte!5906 (_2!6030 lt!203622)) (currentBit!5901 (_2!6030 lt!203622)))))))

(assert (= (and d!42058 res!109761) b!132225))

(assert (= (and b!132225 res!109762) b!132226))

(assert (= (and b!132226 (not res!109763)) b!132227))

(assert (=> b!132225 m!199355))

(assert (=> b!132225 m!199385))

(assert (=> b!132227 m!199355))

(assert (=> b!132227 m!199355))

(declare-fun m!199759 () Bool)

(assert (=> b!132227 m!199759))

(assert (=> b!132045 d!42058))

(declare-fun d!42060 () Bool)

(assert (=> d!42060 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_1!6028 lt!203621)))) ((_ sign_extend 32) (currentByte!5906 (_1!6028 lt!203621))) ((_ sign_extend 32) (currentBit!5901 (_1!6028 lt!203621))) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) (bvsle ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_1!6028 lt!203621)))) ((_ sign_extend 32) (currentByte!5906 (_1!6028 lt!203621))) ((_ sign_extend 32) (currentBit!5901 (_1!6028 lt!203621)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10274 () Bool)

(assert (= bs!10274 d!42060))

(declare-fun m!199761 () Bool)

(assert (=> bs!10274 m!199761))

(assert (=> b!132056 d!42060))

(declare-fun lt!204065 () tuple3!496)

(declare-fun d!42062 () Bool)

(assert (=> d!42062 (= lt!204065 (readByteArrayLoop!0 (_1!6028 lt!203636) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42062 (= (readByteArrayLoopPure!0 (_1!6028 lt!203636) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11453 (_2!6033 lt!204065) (_3!303 lt!204065)))))

(declare-fun bs!10275 () Bool)

(assert (= bs!10275 d!42062))

(declare-fun m!199763 () Bool)

(assert (=> bs!10275 m!199763))

(assert (=> b!132043 d!42062))

(declare-fun d!42064 () Bool)

(assert (=> d!42064 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622))) lt!203633) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622)))) lt!203633))))

(declare-fun bs!10276 () Bool)

(assert (= bs!10276 d!42064))

(assert (=> bs!10276 m!199667))

(assert (=> b!132043 d!42064))

(declare-fun d!42066 () Bool)

(assert (=> d!42066 (validate_offset_bits!1 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622))) lt!203633)))

(declare-fun lt!204068 () Unit!8143)

(declare-fun choose!9 (BitStream!4784 array!6095 (_ BitVec 64) BitStream!4784) Unit!8143)

(assert (=> d!42066 (= lt!204068 (choose!9 (_2!6030 lt!203622) (buf!3127 (_2!6030 lt!203635)) lt!203633 (BitStream!4785 (buf!3127 (_2!6030 lt!203635)) (currentByte!5906 (_2!6030 lt!203622)) (currentBit!5901 (_2!6030 lt!203622)))))))

(assert (=> d!42066 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6030 lt!203622) (buf!3127 (_2!6030 lt!203635)) lt!203633) lt!204068)))

(declare-fun bs!10277 () Bool)

(assert (= bs!10277 d!42066))

(assert (=> bs!10277 m!199369))

(declare-fun m!199765 () Bool)

(assert (=> bs!10277 m!199765))

(assert (=> b!132043 d!42066))

(assert (=> b!132043 d!42007))

(declare-fun d!42068 () Bool)

(declare-fun res!109764 () Bool)

(declare-fun e!87659 () Bool)

(assert (=> d!42068 (=> (not res!109764) (not e!87659))))

(assert (=> d!42068 (= res!109764 (= (size!2760 (buf!3127 thiss!1634)) (size!2760 (buf!3127 (_2!6030 lt!203622)))))))

(assert (=> d!42068 (= (isPrefixOf!0 thiss!1634 (_2!6030 lt!203622)) e!87659)))

(declare-fun b!132228 () Bool)

(declare-fun res!109765 () Bool)

(assert (=> b!132228 (=> (not res!109765) (not e!87659))))

(assert (=> b!132228 (= res!109765 (bvsle (bitIndex!0 (size!2760 (buf!3127 thiss!1634)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634)) (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203622))) (currentByte!5906 (_2!6030 lt!203622)) (currentBit!5901 (_2!6030 lt!203622)))))))

(declare-fun b!132229 () Bool)

(declare-fun e!87658 () Bool)

(assert (=> b!132229 (= e!87659 e!87658)))

(declare-fun res!109766 () Bool)

(assert (=> b!132229 (=> res!109766 e!87658)))

(assert (=> b!132229 (= res!109766 (= (size!2760 (buf!3127 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!132230 () Bool)

(assert (=> b!132230 (= e!87658 (arrayBitRangesEq!0 (buf!3127 thiss!1634) (buf!3127 (_2!6030 lt!203622)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2760 (buf!3127 thiss!1634)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634))))))

(assert (= (and d!42068 res!109764) b!132228))

(assert (= (and b!132228 res!109765) b!132229))

(assert (= (and b!132229 (not res!109766)) b!132230))

(assert (=> b!132228 m!199357))

(assert (=> b!132228 m!199355))

(assert (=> b!132230 m!199357))

(assert (=> b!132230 m!199357))

(declare-fun m!199767 () Bool)

(assert (=> b!132230 m!199767))

(assert (=> b!132054 d!42068))

(declare-fun d!42070 () Bool)

(assert (=> d!42070 (= (array_inv!2549 (buf!3127 thiss!1634)) (bvsge (size!2760 (buf!3127 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!132044 d!42070))

(declare-fun d!42072 () Bool)

(declare-fun e!87660 () Bool)

(assert (=> d!42072 e!87660))

(declare-fun res!109767 () Bool)

(assert (=> d!42072 (=> (not res!109767) (not e!87660))))

(declare-fun lt!204073 () (_ BitVec 64))

(declare-fun lt!204071 () (_ BitVec 64))

(declare-fun lt!204070 () (_ BitVec 64))

(assert (=> d!42072 (= res!109767 (= lt!204071 (bvsub lt!204070 lt!204073)))))

(assert (=> d!42072 (or (= (bvand lt!204070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204073 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204070 lt!204073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42072 (= lt!204073 (remainingBits!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203622)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622)))))))

(declare-fun lt!204072 () (_ BitVec 64))

(declare-fun lt!204069 () (_ BitVec 64))

(assert (=> d!42072 (= lt!204070 (bvmul lt!204072 lt!204069))))

(assert (=> d!42072 (or (= lt!204072 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!204069 (bvsdiv (bvmul lt!204072 lt!204069) lt!204072)))))

(assert (=> d!42072 (= lt!204069 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42072 (= lt!204072 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203622)))))))

(assert (=> d!42072 (= lt!204071 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203622))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203622)))))))

(assert (=> d!42072 (invariant!0 (currentBit!5901 (_2!6030 lt!203622)) (currentByte!5906 (_2!6030 lt!203622)) (size!2760 (buf!3127 (_2!6030 lt!203622))))))

(assert (=> d!42072 (= (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203622))) (currentByte!5906 (_2!6030 lt!203622)) (currentBit!5901 (_2!6030 lt!203622))) lt!204071)))

(declare-fun b!132231 () Bool)

(declare-fun res!109768 () Bool)

(assert (=> b!132231 (=> (not res!109768) (not e!87660))))

(assert (=> b!132231 (= res!109768 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!204071))))

(declare-fun b!132232 () Bool)

(declare-fun lt!204074 () (_ BitVec 64))

(assert (=> b!132232 (= e!87660 (bvsle lt!204071 (bvmul lt!204074 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132232 (or (= lt!204074 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!204074 #b0000000000000000000000000000000000000000000000000000000000001000) lt!204074)))))

(assert (=> b!132232 (= lt!204074 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203622)))))))

(assert (= (and d!42072 res!109767) b!132231))

(assert (= (and b!132231 res!109768) b!132232))

(assert (=> d!42072 m!199743))

(declare-fun m!199769 () Bool)

(assert (=> d!42072 m!199769))

(assert (=> b!132047 d!42072))

(declare-fun d!42074 () Bool)

(declare-fun e!87661 () Bool)

(assert (=> d!42074 e!87661))

(declare-fun res!109769 () Bool)

(assert (=> d!42074 (=> (not res!109769) (not e!87661))))

(declare-fun lt!204079 () (_ BitVec 64))

(declare-fun lt!204077 () (_ BitVec 64))

(declare-fun lt!204076 () (_ BitVec 64))

(assert (=> d!42074 (= res!109769 (= lt!204077 (bvsub lt!204076 lt!204079)))))

(assert (=> d!42074 (or (= (bvand lt!204076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204079 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204076 lt!204079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42074 (= lt!204079 (remainingBits!0 ((_ sign_extend 32) (size!2760 (buf!3127 thiss!1634))) ((_ sign_extend 32) (currentByte!5906 thiss!1634)) ((_ sign_extend 32) (currentBit!5901 thiss!1634))))))

(declare-fun lt!204078 () (_ BitVec 64))

(declare-fun lt!204075 () (_ BitVec 64))

(assert (=> d!42074 (= lt!204076 (bvmul lt!204078 lt!204075))))

(assert (=> d!42074 (or (= lt!204078 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!204075 (bvsdiv (bvmul lt!204078 lt!204075) lt!204078)))))

(assert (=> d!42074 (= lt!204075 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42074 (= lt!204078 ((_ sign_extend 32) (size!2760 (buf!3127 thiss!1634))))))

(assert (=> d!42074 (= lt!204077 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5906 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5901 thiss!1634))))))

(assert (=> d!42074 (invariant!0 (currentBit!5901 thiss!1634) (currentByte!5906 thiss!1634) (size!2760 (buf!3127 thiss!1634)))))

(assert (=> d!42074 (= (bitIndex!0 (size!2760 (buf!3127 thiss!1634)) (currentByte!5906 thiss!1634) (currentBit!5901 thiss!1634)) lt!204077)))

(declare-fun b!132233 () Bool)

(declare-fun res!109770 () Bool)

(assert (=> b!132233 (=> (not res!109770) (not e!87661))))

(assert (=> b!132233 (= res!109770 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!204077))))

(declare-fun b!132234 () Bool)

(declare-fun lt!204080 () (_ BitVec 64))

(assert (=> b!132234 (= e!87661 (bvsle lt!204077 (bvmul lt!204080 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132234 (or (= lt!204080 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!204080 #b0000000000000000000000000000000000000000000000000000000000001000) lt!204080)))))

(assert (=> b!132234 (= lt!204080 ((_ sign_extend 32) (size!2760 (buf!3127 thiss!1634))))))

(assert (= (and d!42074 res!109769) b!132233))

(assert (= (and b!132233 res!109770) b!132234))

(assert (=> d!42074 m!199469))

(assert (=> d!42074 m!199387))

(assert (=> b!132047 d!42074))

(declare-fun d!42076 () Bool)

(assert (=> d!42076 (= (invariant!0 (currentBit!5901 thiss!1634) (currentByte!5906 thiss!1634) (size!2760 (buf!3127 (_2!6030 lt!203622)))) (and (bvsge (currentBit!5901 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5901 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5906 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5906 thiss!1634) (size!2760 (buf!3127 (_2!6030 lt!203622)))) (and (= (currentBit!5901 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5906 thiss!1634) (size!2760 (buf!3127 (_2!6030 lt!203622))))))))))

(assert (=> b!132048 d!42076))

(declare-fun d!42078 () Bool)

(declare-fun e!87662 () Bool)

(assert (=> d!42078 e!87662))

(declare-fun res!109771 () Bool)

(assert (=> d!42078 (=> (not res!109771) (not e!87662))))

(declare-fun lt!204082 () (_ BitVec 64))

(declare-fun lt!204083 () (_ BitVec 64))

(declare-fun lt!204085 () (_ BitVec 64))

(assert (=> d!42078 (= res!109771 (= lt!204083 (bvsub lt!204082 lt!204085)))))

(assert (=> d!42078 (or (= (bvand lt!204082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204085 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204082 lt!204085) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42078 (= lt!204085 (remainingBits!0 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))) ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203635))) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203635)))))))

(declare-fun lt!204084 () (_ BitVec 64))

(declare-fun lt!204081 () (_ BitVec 64))

(assert (=> d!42078 (= lt!204082 (bvmul lt!204084 lt!204081))))

(assert (=> d!42078 (or (= lt!204084 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!204081 (bvsdiv (bvmul lt!204084 lt!204081) lt!204084)))))

(assert (=> d!42078 (= lt!204081 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42078 (= lt!204084 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))))))

(assert (=> d!42078 (= lt!204083 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5906 (_2!6030 lt!203635))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5901 (_2!6030 lt!203635)))))))

(assert (=> d!42078 (invariant!0 (currentBit!5901 (_2!6030 lt!203635)) (currentByte!5906 (_2!6030 lt!203635)) (size!2760 (buf!3127 (_2!6030 lt!203635))))))

(assert (=> d!42078 (= (bitIndex!0 (size!2760 (buf!3127 (_2!6030 lt!203635))) (currentByte!5906 (_2!6030 lt!203635)) (currentBit!5901 (_2!6030 lt!203635))) lt!204083)))

(declare-fun b!132235 () Bool)

(declare-fun res!109772 () Bool)

(assert (=> b!132235 (=> (not res!109772) (not e!87662))))

(assert (=> b!132235 (= res!109772 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!204083))))

(declare-fun b!132236 () Bool)

(declare-fun lt!204086 () (_ BitVec 64))

(assert (=> b!132236 (= e!87662 (bvsle lt!204083 (bvmul lt!204086 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132236 (or (= lt!204086 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!204086 #b0000000000000000000000000000000000000000000000000000000000001000) lt!204086)))))

(assert (=> b!132236 (= lt!204086 ((_ sign_extend 32) (size!2760 (buf!3127 (_2!6030 lt!203635)))))))

(assert (= (and d!42078 res!109771) b!132235))

(assert (= (and b!132235 res!109772) b!132236))

(declare-fun m!199771 () Bool)

(assert (=> d!42078 m!199771))

(declare-fun m!199773 () Bool)

(assert (=> d!42078 m!199773))

(assert (=> b!132046 d!42078))

(assert (=> b!132046 d!42072))

(declare-fun d!42080 () Bool)

(assert (=> d!42080 (= (array_inv!2549 arr!237) (bvsge (size!2760 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25820 d!42080))

(declare-fun d!42082 () Bool)

(assert (=> d!42082 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5901 thiss!1634) (currentByte!5906 thiss!1634) (size!2760 (buf!3127 thiss!1634))))))

(declare-fun bs!10278 () Bool)

(assert (= bs!10278 d!42082))

(assert (=> bs!10278 m!199387))

(assert (=> start!25820 d!42082))

(push 1)

(assert (not b!132107))

(assert (not d!41978))

(assert (not d!42064))

(assert (not b!132105))

(assert (not d!42007))

(assert (not b!132177))

(assert (not b!132225))

(assert (not d!41946))

(assert (not b!132224))

(assert (not d!42074))

(assert (not d!41976))

(assert (not b!132194))

(assert (not b!132166))

(assert (not d!41968))

(assert (not b!132106))

(assert (not b!132223))

(assert (not b!132222))

(assert (not d!42005))

(assert (not b!132228))

(assert (not b!132227))

(assert (not d!42013))

(assert (not b!132192))

(assert (not b!132230))

(assert (not b!132178))

(assert (not b!132191))

(assert (not d!42072))

(assert (not d!42060))

(assert (not b!132163))

(assert (not b!132174))

(assert (not d!42015))

(assert (not b!132108))

(assert (not d!42017))

(assert (not b!132213))

(assert (not d!42048))

(assert (not d!42056))

(assert (not d!42066))

(assert (not b!132179))

(assert (not d!42009))

(assert (not d!41974))

(assert (not d!42023))

(assert (not d!42050))

(assert (not b!132176))

(assert (not b!132180))

(assert (not d!42078))

(assert (not d!42011))

(assert (not d!42082))

(assert (not b!132167))

(assert (not d!42003))

(assert (not b!132164))

(assert (not d!41970))

(assert (not b!132193))

(assert (not d!42062))

(assert (not d!41980))

(assert (not d!42027))

(assert (not d!41964))

(assert (not b!132165))

(assert (not b!132088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

