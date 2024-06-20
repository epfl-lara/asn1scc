; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24422 () Bool)

(assert start!24422)

(declare-fun res!103041 () Bool)

(declare-fun e!81536 () Bool)

(assert (=> start!24422 (=> (not res!103041) (not e!81536))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!24422 (= res!103041 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24422 e!81536))

(assert (=> start!24422 true))

(declare-datatypes ((array!5483 0))(
  ( (array!5484 (arr!3075 (Array (_ BitVec 32) (_ BitVec 8))) (size!2482 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4438 0))(
  ( (BitStream!4439 (buf!2928 array!5483) (currentByte!5634 (_ BitVec 32)) (currentBit!5629 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4438)

(declare-fun e!81533 () Bool)

(declare-fun inv!12 (BitStream!4438) Bool)

(assert (=> start!24422 (and (inv!12 thiss!1305) e!81533)))

(declare-fun b!124301 () Bool)

(declare-fun res!103043 () Bool)

(declare-fun e!81537 () Bool)

(assert (=> b!124301 (=> (not res!103043) (not e!81537))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124301 (= res!103043 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124302 () Bool)

(declare-fun e!81534 () Bool)

(assert (=> b!124302 (= e!81537 (not e!81534))))

(declare-fun res!103040 () Bool)

(assert (=> b!124302 (=> (not res!103040) (not e!81534))))

(declare-fun lt!195916 () (_ BitVec 64))

(declare-fun lt!195918 () (_ BitVec 64))

(assert (=> b!124302 (= res!103040 (= lt!195916 (bvadd lt!195916 lt!195918)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124302 (= lt!195916 (bitIndex!0 (size!2482 (buf!2928 thiss!1305)) (currentByte!5634 thiss!1305) (currentBit!5629 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4438 BitStream!4438) Bool)

(assert (=> b!124302 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7708 0))(
  ( (Unit!7709) )
))
(declare-fun lt!195917 () Unit!7708)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4438) Unit!7708)

(assert (=> b!124302 (= lt!195917 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-datatypes ((tuple2!10450 0))(
  ( (tuple2!10451 (_1!5493 BitStream!4438) (_2!5493 BitStream!4438)) )
))
(declare-fun lt!195921 () tuple2!10450)

(declare-fun b!124303 () Bool)

(declare-datatypes ((tuple2!10452 0))(
  ( (tuple2!10453 (_1!5494 BitStream!4438) (_2!5494 (_ BitVec 64))) )
))
(declare-fun lt!195919 () tuple2!10452)

(assert (=> b!124303 (= e!81534 (and (= (_2!5494 lt!195919) v!199) (= (_1!5494 lt!195919) (_2!5493 lt!195921))))))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10452)

(assert (=> b!124303 (= lt!195919 (readNLeastSignificantBitsLoopPure!0 (_1!5493 lt!195921) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!195920 () Unit!7708)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4438 array!5483 (_ BitVec 64)) Unit!7708)

(assert (=> b!124303 (= lt!195920 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2928 thiss!1305) lt!195918))))

(declare-fun reader!0 (BitStream!4438 BitStream!4438) tuple2!10450)

(assert (=> b!124303 (= lt!195921 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!124304 () Bool)

(declare-fun array_inv!2284 (array!5483) Bool)

(assert (=> b!124304 (= e!81533 (array_inv!2284 (buf!2928 thiss!1305)))))

(declare-fun b!124305 () Bool)

(declare-fun res!103042 () Bool)

(assert (=> b!124305 (=> (not res!103042) (not e!81537))))

(assert (=> b!124305 (= res!103042 (bvsge i!615 nBits!396))))

(declare-fun b!124306 () Bool)

(assert (=> b!124306 (= e!81536 e!81537)))

(declare-fun res!103044 () Bool)

(assert (=> b!124306 (=> (not res!103044) (not e!81537))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124306 (= res!103044 (validate_offset_bits!1 ((_ sign_extend 32) (size!2482 (buf!2928 thiss!1305))) ((_ sign_extend 32) (currentByte!5634 thiss!1305)) ((_ sign_extend 32) (currentBit!5629 thiss!1305)) lt!195918))))

(assert (=> b!124306 (= lt!195918 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!24422 res!103041) b!124306))

(assert (= (and b!124306 res!103044) b!124301))

(assert (= (and b!124301 res!103043) b!124305))

(assert (= (and b!124305 res!103042) b!124302))

(assert (= (and b!124302 res!103040) b!124303))

(assert (= start!24422 b!124304))

(declare-fun m!189499 () Bool)

(assert (=> b!124303 m!189499))

(declare-fun m!189501 () Bool)

(assert (=> b!124303 m!189501))

(declare-fun m!189503 () Bool)

(assert (=> b!124303 m!189503))

(declare-fun m!189505 () Bool)

(assert (=> b!124303 m!189505))

(declare-fun m!189507 () Bool)

(assert (=> b!124302 m!189507))

(declare-fun m!189509 () Bool)

(assert (=> b!124302 m!189509))

(declare-fun m!189511 () Bool)

(assert (=> b!124302 m!189511))

(declare-fun m!189513 () Bool)

(assert (=> b!124301 m!189513))

(declare-fun m!189515 () Bool)

(assert (=> start!24422 m!189515))

(declare-fun m!189517 () Bool)

(assert (=> b!124304 m!189517))

(declare-fun m!189519 () Bool)

(assert (=> b!124306 m!189519))

(push 1)

(assert (not start!24422))

(assert (not b!124304))

(assert (not b!124303))

(assert (not b!124301))

(assert (not b!124306))

(assert (not b!124302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!40452 () Bool)

(declare-datatypes ((tuple2!10464 0))(
  ( (tuple2!10465 (_1!5500 (_ BitVec 64)) (_2!5500 BitStream!4438)) )
))
(declare-fun lt!195966 () tuple2!10464)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10464)

(assert (=> d!40452 (= lt!195966 (readNLeastSignificantBitsLoop!0 (_1!5493 lt!195921) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> d!40452 (= (readNLeastSignificantBitsLoopPure!0 (_1!5493 lt!195921) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) (tuple2!10453 (_2!5500 lt!195966) (_1!5500 lt!195966)))))

(declare-fun bs!9747 () Bool)

(assert (= bs!9747 d!40452))

(declare-fun m!189573 () Bool)

(assert (=> bs!9747 m!189573))

(assert (=> b!124303 d!40452))

(declare-fun d!40454 () Bool)

(assert (=> d!40454 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!124303 d!40454))

(declare-fun d!40456 () Bool)

(assert (=> d!40456 (validate_offset_bits!1 ((_ sign_extend 32) (size!2482 (buf!2928 thiss!1305))) ((_ sign_extend 32) (currentByte!5634 thiss!1305)) ((_ sign_extend 32) (currentBit!5629 thiss!1305)) lt!195918)))

(declare-fun lt!195969 () Unit!7708)

(declare-fun choose!9 (BitStream!4438 array!5483 (_ BitVec 64) BitStream!4438) Unit!7708)

(assert (=> d!40456 (= lt!195969 (choose!9 thiss!1305 (buf!2928 thiss!1305) lt!195918 (BitStream!4439 (buf!2928 thiss!1305) (currentByte!5634 thiss!1305) (currentBit!5629 thiss!1305))))))

(assert (=> d!40456 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2928 thiss!1305) lt!195918) lt!195969)))

(declare-fun bs!9748 () Bool)

(assert (= bs!9748 d!40456))

(assert (=> bs!9748 m!189519))

(declare-fun m!189575 () Bool)

(assert (=> bs!9748 m!189575))

(assert (=> b!124303 d!40456))

(declare-fun b!124368 () Bool)

(declare-fun e!81579 () Unit!7708)

(declare-fun Unit!7715 () Unit!7708)

(assert (=> b!124368 (= e!81579 Unit!7715)))

(declare-fun e!81578 () Bool)

(declare-fun lt!196088 () (_ BitVec 64))

(declare-fun lt!196095 () (_ BitVec 64))

(declare-fun b!124369 () Bool)

(declare-fun lt!196094 () tuple2!10450)

(declare-fun withMovedBitIndex!0 (BitStream!4438 (_ BitVec 64)) BitStream!4438)

(assert (=> b!124369 (= e!81578 (= (_1!5493 lt!196094) (withMovedBitIndex!0 (_2!5493 lt!196094) (bvsub lt!196088 lt!196095))))))

(assert (=> b!124369 (or (= (bvand lt!196088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196088 lt!196095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!124369 (= lt!196095 (bitIndex!0 (size!2482 (buf!2928 thiss!1305)) (currentByte!5634 thiss!1305) (currentBit!5629 thiss!1305)))))

(assert (=> b!124369 (= lt!196088 (bitIndex!0 (size!2482 (buf!2928 thiss!1305)) (currentByte!5634 thiss!1305) (currentBit!5629 thiss!1305)))))

(declare-fun b!124370 () Bool)

(declare-fun res!103090 () Bool)

(assert (=> b!124370 (=> (not res!103090) (not e!81578))))

(assert (=> b!124370 (= res!103090 (isPrefixOf!0 (_2!5493 lt!196094) thiss!1305))))

(declare-fun d!40458 () Bool)

(assert (=> d!40458 e!81578))

(declare-fun res!103091 () Bool)

(assert (=> d!40458 (=> (not res!103091) (not e!81578))))

(assert (=> d!40458 (= res!103091 (isPrefixOf!0 (_1!5493 lt!196094) (_2!5493 lt!196094)))))

(declare-fun lt!196085 () BitStream!4438)

(assert (=> d!40458 (= lt!196094 (tuple2!10451 lt!196085 thiss!1305))))

(declare-fun lt!196079 () Unit!7708)

(declare-fun lt!196077 () Unit!7708)

(assert (=> d!40458 (= lt!196079 lt!196077)))

(assert (=> d!40458 (isPrefixOf!0 lt!196085 thiss!1305)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4438 BitStream!4438 BitStream!4438) Unit!7708)

(assert (=> d!40458 (= lt!196077 (lemmaIsPrefixTransitive!0 lt!196085 thiss!1305 thiss!1305))))

(declare-fun lt!196081 () Unit!7708)

(declare-fun lt!196092 () Unit!7708)

(assert (=> d!40458 (= lt!196081 lt!196092)))

(assert (=> d!40458 (isPrefixOf!0 lt!196085 thiss!1305)))

(assert (=> d!40458 (= lt!196092 (lemmaIsPrefixTransitive!0 lt!196085 thiss!1305 thiss!1305))))

(declare-fun lt!196090 () Unit!7708)

(assert (=> d!40458 (= lt!196090 e!81579)))

(declare-fun c!7423 () Bool)

(assert (=> d!40458 (= c!7423 (not (= (size!2482 (buf!2928 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!196093 () Unit!7708)

(declare-fun lt!196078 () Unit!7708)

(assert (=> d!40458 (= lt!196093 lt!196078)))

(assert (=> d!40458 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!40458 (= lt!196078 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun lt!196082 () Unit!7708)

(declare-fun lt!196087 () Unit!7708)

(assert (=> d!40458 (= lt!196082 lt!196087)))

(assert (=> d!40458 (= lt!196087 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun lt!196084 () Unit!7708)

(declare-fun lt!196080 () Unit!7708)

(assert (=> d!40458 (= lt!196084 lt!196080)))

(assert (=> d!40458 (isPrefixOf!0 lt!196085 lt!196085)))

(assert (=> d!40458 (= lt!196080 (lemmaIsPrefixRefl!0 lt!196085))))

(declare-fun lt!196091 () Unit!7708)

(declare-fun lt!196086 () Unit!7708)

(assert (=> d!40458 (= lt!196091 lt!196086)))

(assert (=> d!40458 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!40458 (= lt!196086 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!40458 (= lt!196085 (BitStream!4439 (buf!2928 thiss!1305) (currentByte!5634 thiss!1305) (currentBit!5629 thiss!1305)))))

(assert (=> d!40458 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!40458 (= (reader!0 thiss!1305 thiss!1305) lt!196094)))

(declare-fun b!124371 () Bool)

(declare-fun res!103092 () Bool)

(assert (=> b!124371 (=> (not res!103092) (not e!81578))))

(assert (=> b!124371 (= res!103092 (isPrefixOf!0 (_1!5493 lt!196094) thiss!1305))))

(declare-fun b!124372 () Bool)

(declare-fun lt!196076 () Unit!7708)

(assert (=> b!124372 (= e!81579 lt!196076)))

(declare-fun lt!196089 () (_ BitVec 64))

(assert (=> b!124372 (= lt!196089 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!196083 () (_ BitVec 64))

(assert (=> b!124372 (= lt!196083 (bitIndex!0 (size!2482 (buf!2928 thiss!1305)) (currentByte!5634 thiss!1305) (currentBit!5629 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5483 array!5483 (_ BitVec 64) (_ BitVec 64)) Unit!7708)

(assert (=> b!124372 (= lt!196076 (arrayBitRangesEqSymmetric!0 (buf!2928 thiss!1305) (buf!2928 thiss!1305) lt!196089 lt!196083))))

(declare-fun arrayBitRangesEq!0 (array!5483 array!5483 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124372 (arrayBitRangesEq!0 (buf!2928 thiss!1305) (buf!2928 thiss!1305) lt!196089 lt!196083)))

(assert (= (and d!40458 c!7423) b!124372))

(assert (= (and d!40458 (not c!7423)) b!124368))

(assert (= (and d!40458 res!103091) b!124371))

(assert (= (and b!124371 res!103092) b!124370))

(assert (= (and b!124370 res!103090) b!124369))

(declare-fun m!189603 () Bool)

(assert (=> b!124371 m!189603))

(declare-fun m!189605 () Bool)

(assert (=> d!40458 m!189605))

(assert (=> d!40458 m!189509))

(declare-fun m!189607 () Bool)

(assert (=> d!40458 m!189607))

(assert (=> d!40458 m!189511))

(declare-fun m!189609 () Bool)

(assert (=> d!40458 m!189609))

(assert (=> d!40458 m!189605))

(declare-fun m!189611 () Bool)

(assert (=> d!40458 m!189611))

(assert (=> d!40458 m!189509))

(assert (=> d!40458 m!189509))

(assert (=> d!40458 m!189511))

(declare-fun m!189613 () Bool)

(assert (=> d!40458 m!189613))

(declare-fun m!189615 () Bool)

(assert (=> b!124369 m!189615))

(assert (=> b!124369 m!189507))

(assert (=> b!124369 m!189507))

(assert (=> b!124372 m!189507))

(declare-fun m!189617 () Bool)

(assert (=> b!124372 m!189617))

(declare-fun m!189619 () Bool)

(assert (=> b!124372 m!189619))

(declare-fun m!189621 () Bool)

(assert (=> b!124370 m!189621))

(assert (=> b!124303 d!40458))

(declare-fun d!40476 () Bool)

(declare-fun e!81591 () Bool)

(assert (=> d!40476 e!81591))

(declare-fun res!103113 () Bool)

(assert (=> d!40476 (=> (not res!103113) (not e!81591))))

(declare-fun lt!196132 () (_ BitVec 64))

(declare-fun lt!196130 () (_ BitVec 64))

(declare-fun lt!196129 () (_ BitVec 64))

(assert (=> d!40476 (= res!103113 (= lt!196130 (bvsub lt!196132 lt!196129)))))

(assert (=> d!40476 (or (= (bvand lt!196132 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196129 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196132 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196132 lt!196129) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!40476 (= lt!196129 (remainingBits!0 ((_ sign_extend 32) (size!2482 (buf!2928 thiss!1305))) ((_ sign_extend 32) (currentByte!5634 thiss!1305)) ((_ sign_extend 32) (currentBit!5629 thiss!1305))))))

(declare-fun lt!196133 () (_ BitVec 64))

(declare-fun lt!196131 () (_ BitVec 64))

(assert (=> d!40476 (= lt!196132 (bvmul lt!196133 lt!196131))))

(assert (=> d!40476 (or (= lt!196133 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!196131 (bvsdiv (bvmul lt!196133 lt!196131) lt!196133)))))

(assert (=> d!40476 (= lt!196131 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40476 (= lt!196133 ((_ sign_extend 32) (size!2482 (buf!2928 thiss!1305))))))

(assert (=> d!40476 (= lt!196130 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5634 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5629 thiss!1305))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!40476 (invariant!0 (currentBit!5629 thiss!1305) (currentByte!5634 thiss!1305) (size!2482 (buf!2928 thiss!1305)))))

(assert (=> d!40476 (= (bitIndex!0 (size!2482 (buf!2928 thiss!1305)) (currentByte!5634 thiss!1305) (currentBit!5629 thiss!1305)) lt!196130)))

(declare-fun b!124392 () Bool)

(declare-fun res!103112 () Bool)

(assert (=> b!124392 (=> (not res!103112) (not e!81591))))

(assert (=> b!124392 (= res!103112 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!196130))))

(declare-fun b!124393 () Bool)

(declare-fun lt!196134 () (_ BitVec 64))

(assert (=> b!124393 (= e!81591 (bvsle lt!196130 (bvmul lt!196134 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!124393 (or (= lt!196134 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!196134 #b0000000000000000000000000000000000000000000000000000000000001000) lt!196134)))))

(assert (=> b!124393 (= lt!196134 ((_ sign_extend 32) (size!2482 (buf!2928 thiss!1305))))))

(assert (= (and d!40476 res!103113) b!124392))

(assert (= (and b!124392 res!103112) b!124393))

(declare-fun m!189627 () Bool)

(assert (=> d!40476 m!189627))

(declare-fun m!189629 () Bool)

(assert (=> d!40476 m!189629))

(assert (=> b!124302 d!40476))

(declare-fun d!40482 () Bool)

(declare-fun res!103120 () Bool)

(declare-fun e!81596 () Bool)

(assert (=> d!40482 (=> (not res!103120) (not e!81596))))

(assert (=> d!40482 (= res!103120 (= (size!2482 (buf!2928 thiss!1305)) (size!2482 (buf!2928 thiss!1305))))))

(assert (=> d!40482 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!81596)))

(declare-fun b!124400 () Bool)

(declare-fun res!103121 () Bool)

(assert (=> b!124400 (=> (not res!103121) (not e!81596))))

(assert (=> b!124400 (= res!103121 (bvsle (bitIndex!0 (size!2482 (buf!2928 thiss!1305)) (currentByte!5634 thiss!1305) (currentBit!5629 thiss!1305)) (bitIndex!0 (size!2482 (buf!2928 thiss!1305)) (currentByte!5634 thiss!1305) (currentBit!5629 thiss!1305))))))

(declare-fun b!124401 () Bool)

(declare-fun e!81597 () Bool)

(assert (=> b!124401 (= e!81596 e!81597)))

(declare-fun res!103122 () Bool)

(assert (=> b!124401 (=> res!103122 e!81597)))

(assert (=> b!124401 (= res!103122 (= (size!2482 (buf!2928 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!124402 () Bool)

(assert (=> b!124402 (= e!81597 (arrayBitRangesEq!0 (buf!2928 thiss!1305) (buf!2928 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2482 (buf!2928 thiss!1305)) (currentByte!5634 thiss!1305) (currentBit!5629 thiss!1305))))))

(assert (= (and d!40482 res!103120) b!124400))

(assert (= (and b!124400 res!103121) b!124401))

(assert (= (and b!124401 (not res!103122)) b!124402))

(assert (=> b!124400 m!189507))

(assert (=> b!124400 m!189507))

(assert (=> b!124402 m!189507))

(assert (=> b!124402 m!189507))

(declare-fun m!189631 () Bool)

(assert (=> b!124402 m!189631))

(assert (=> b!124302 d!40482))

(declare-fun d!40484 () Bool)

(assert (=> d!40484 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!196177 () Unit!7708)

(declare-fun choose!11 (BitStream!4438) Unit!7708)

(assert (=> d!40484 (= lt!196177 (choose!11 thiss!1305))))

(assert (=> d!40484 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!196177)))

(declare-fun bs!9755 () Bool)

(assert (= bs!9755 d!40484))

(assert (=> bs!9755 m!189509))

(declare-fun m!189633 () Bool)

(assert (=> bs!9755 m!189633))

(assert (=> b!124302 d!40484))

(declare-fun d!40486 () Bool)

(assert (=> d!40486 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2482 (buf!2928 thiss!1305))) ((_ sign_extend 32) (currentByte!5634 thiss!1305)) ((_ sign_extend 32) (currentBit!5629 thiss!1305)) lt!195918) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2482 (buf!2928 thiss!1305))) ((_ sign_extend 32) (currentByte!5634 thiss!1305)) ((_ sign_extend 32) (currentBit!5629 thiss!1305))) lt!195918))))

(declare-fun bs!9756 () Bool)

(assert (= bs!9756 d!40486))

(assert (=> bs!9756 m!189627))

(assert (=> b!124306 d!40486))

(declare-fun d!40488 () Bool)

(assert (=> d!40488 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!124301 d!40488))

(declare-fun d!40490 () Bool)

(assert (=> d!40490 (= (array_inv!2284 (buf!2928 thiss!1305)) (bvsge (size!2482 (buf!2928 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!124304 d!40490))

(declare-fun d!40492 () Bool)

(assert (=> d!40492 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5629 thiss!1305) (currentByte!5634 thiss!1305) (size!2482 (buf!2928 thiss!1305))))))

(declare-fun bs!9757 () Bool)

(assert (= bs!9757 d!40492))

(assert (=> bs!9757 m!189629))

(assert (=> start!24422 d!40492))

(push 1)

(assert (not d!40476))

(assert (not d!40486))

(assert (not b!124369))

(assert (not b!124371))

(assert (not b!124370))

(assert (not b!124400))

(assert (not d!40492))

(assert (not d!40458))

(assert (not b!124402))

(assert (not b!124372))

(assert (not d!40452))

(assert (not d!40484))

(assert (not d!40456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

