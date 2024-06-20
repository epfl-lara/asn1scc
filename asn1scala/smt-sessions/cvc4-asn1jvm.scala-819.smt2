; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24180 () Bool)

(assert start!24180)

(declare-fun b!122700 () Bool)

(declare-fun e!80432 () Bool)

(assert (=> b!122700 (= e!80432 true)))

(declare-fun e!80439 () Bool)

(assert (=> b!122700 e!80439))

(declare-fun res!101705 () Bool)

(assert (=> b!122700 (=> (not res!101705) (not e!80439))))

(declare-datatypes ((array!5430 0))(
  ( (array!5431 (arr!3050 (Array (_ BitVec 32) (_ BitVec 8))) (size!2457 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4388 0))(
  ( (BitStream!4389 (buf!2897 array!5430) (currentByte!5594 (_ BitVec 32)) (currentBit!5589 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10376 0))(
  ( (tuple2!10377 (_1!5453 BitStream!4388) (_2!5453 BitStream!4388)) )
))
(declare-fun lt!193133 () tuple2!10376)

(declare-fun lt!193131 () (_ BitVec 64))

(declare-fun lt!193121 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4388 (_ BitVec 64)) BitStream!4388)

(assert (=> b!122700 (= res!101705 (= (_1!5453 lt!193133) (withMovedBitIndex!0 (_2!5453 lt!193133) (bvsub lt!193121 lt!193131))))))

(declare-datatypes ((Unit!7553 0))(
  ( (Unit!7554) )
))
(declare-datatypes ((tuple2!10378 0))(
  ( (tuple2!10379 (_1!5454 Unit!7553) (_2!5454 BitStream!4388)) )
))
(declare-fun lt!193141 () tuple2!10378)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122700 (= lt!193121 (bitIndex!0 (size!2457 (buf!2897 (_2!5454 lt!193141))) (currentByte!5594 (_2!5454 lt!193141)) (currentBit!5589 (_2!5454 lt!193141))))))

(declare-fun lt!193143 () tuple2!10376)

(declare-fun lt!193125 () (_ BitVec 64))

(assert (=> b!122700 (= (_1!5453 lt!193143) (withMovedBitIndex!0 (_2!5453 lt!193143) (bvsub lt!193125 lt!193131)))))

(declare-fun lt!193145 () tuple2!10378)

(assert (=> b!122700 (= lt!193131 (bitIndex!0 (size!2457 (buf!2897 (_2!5454 lt!193145))) (currentByte!5594 (_2!5454 lt!193145)) (currentBit!5589 (_2!5454 lt!193145))))))

(declare-fun thiss!1305 () BitStream!4388)

(assert (=> b!122700 (= lt!193125 (bitIndex!0 (size!2457 (buf!2897 thiss!1305)) (currentByte!5594 thiss!1305) (currentBit!5589 thiss!1305)))))

(declare-datatypes ((tuple2!10380 0))(
  ( (tuple2!10381 (_1!5455 BitStream!4388) (_2!5455 (_ BitVec 64))) )
))
(declare-fun lt!193138 () tuple2!10380)

(declare-fun lt!193132 () tuple2!10380)

(assert (=> b!122700 (and (= (_2!5455 lt!193138) (_2!5455 lt!193132)) (= (_1!5455 lt!193138) (_1!5455 lt!193132)))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!193140 () (_ BitVec 64))

(declare-fun lt!193124 () Unit!7553)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7553)

(assert (=> b!122700 (= lt!193124 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5453 lt!193143) nBits!396 i!615 lt!193140))))

(declare-fun lt!193149 () (_ BitVec 64))

(declare-fun lt!193147 () BitStream!4388)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10380)

(assert (=> b!122700 (= lt!193132 (readNLeastSignificantBitsLoopPure!0 lt!193147 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193149))))

(assert (=> b!122700 (= lt!193147 (withMovedBitIndex!0 (_1!5453 lt!193143) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!122701 () Bool)

(declare-fun res!101712 () Bool)

(declare-fun e!80431 () Bool)

(assert (=> b!122701 (=> (not res!101712) (not e!80431))))

(assert (=> b!122701 (= res!101712 (bvslt i!615 nBits!396))))

(declare-fun b!122702 () Bool)

(declare-fun e!80430 () Bool)

(declare-datatypes ((tuple2!10382 0))(
  ( (tuple2!10383 (_1!5456 BitStream!4388) (_2!5456 Bool)) )
))
(declare-fun lt!193136 () tuple2!10382)

(declare-fun lt!193146 () (_ BitVec 64))

(assert (=> b!122702 (= e!80430 (= (bitIndex!0 (size!2457 (buf!2897 (_1!5456 lt!193136))) (currentByte!5594 (_1!5456 lt!193136)) (currentBit!5589 (_1!5456 lt!193136))) lt!193146))))

(declare-fun b!122703 () Bool)

(declare-fun e!80429 () Bool)

(declare-fun e!80435 () Bool)

(assert (=> b!122703 (= e!80429 e!80435)))

(declare-fun res!101704 () Bool)

(assert (=> b!122703 (=> (not res!101704) (not e!80435))))

(declare-fun lt!193135 () (_ BitVec 64))

(assert (=> b!122703 (= res!101704 (= lt!193146 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!193135)))))

(assert (=> b!122703 (= lt!193146 (bitIndex!0 (size!2457 (buf!2897 (_2!5454 lt!193141))) (currentByte!5594 (_2!5454 lt!193141)) (currentBit!5589 (_2!5454 lt!193141))))))

(assert (=> b!122703 (= lt!193135 (bitIndex!0 (size!2457 (buf!2897 thiss!1305)) (currentByte!5594 thiss!1305) (currentBit!5589 thiss!1305)))))

(declare-fun b!122705 () Bool)

(declare-fun e!80434 () Bool)

(declare-fun lt!193129 () tuple2!10382)

(declare-fun lt!193122 () tuple2!10382)

(assert (=> b!122705 (= e!80434 (= (_2!5456 lt!193129) (_2!5456 lt!193122)))))

(declare-fun b!122706 () Bool)

(declare-fun res!101708 () Bool)

(assert (=> b!122706 (=> (not res!101708) (not e!80431))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122706 (= res!101708 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!122707 () Bool)

(declare-fun e!80436 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122707 (= e!80436 (invariant!0 (currentBit!5589 thiss!1305) (currentByte!5594 thiss!1305) (size!2457 (buf!2897 (_2!5454 lt!193145)))))))

(declare-fun b!122708 () Bool)

(assert (=> b!122708 (= e!80431 (not e!80432))))

(declare-fun res!101715 () Bool)

(assert (=> b!122708 (=> res!101715 e!80432)))

(declare-fun lt!193134 () tuple2!10380)

(assert (=> b!122708 (= res!101715 (not (= (_1!5455 lt!193134) (_2!5453 lt!193133))))))

(assert (=> b!122708 (= lt!193134 (readNLeastSignificantBitsLoopPure!0 (_1!5453 lt!193133) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193149))))

(declare-fun lt!193144 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122708 (validate_offset_bits!1 ((_ sign_extend 32) (size!2457 (buf!2897 (_2!5454 lt!193145)))) ((_ sign_extend 32) (currentByte!5594 (_2!5454 lt!193141))) ((_ sign_extend 32) (currentBit!5589 (_2!5454 lt!193141))) lt!193144)))

(declare-fun lt!193148 () Unit!7553)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4388 array!5430 (_ BitVec 64)) Unit!7553)

(assert (=> b!122708 (= lt!193148 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5454 lt!193141) (buf!2897 (_2!5454 lt!193145)) lt!193144))))

(assert (=> b!122708 (= lt!193144 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!193139 () (_ BitVec 64))

(declare-fun lt!193142 () tuple2!10382)

(assert (=> b!122708 (= lt!193149 (bvor lt!193140 (ite (_2!5456 lt!193142) lt!193139 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122708 (= lt!193138 (readNLeastSignificantBitsLoopPure!0 (_1!5453 lt!193143) nBits!396 i!615 lt!193140))))

(declare-fun lt!193128 () (_ BitVec 64))

(assert (=> b!122708 (validate_offset_bits!1 ((_ sign_extend 32) (size!2457 (buf!2897 (_2!5454 lt!193145)))) ((_ sign_extend 32) (currentByte!5594 thiss!1305)) ((_ sign_extend 32) (currentBit!5589 thiss!1305)) lt!193128)))

(declare-fun lt!193137 () Unit!7553)

(assert (=> b!122708 (= lt!193137 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2897 (_2!5454 lt!193145)) lt!193128))))

(assert (=> b!122708 (= lt!193140 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!193123 () Bool)

(assert (=> b!122708 (= (_2!5456 lt!193142) lt!193123)))

(declare-fun readBitPure!0 (BitStream!4388) tuple2!10382)

(assert (=> b!122708 (= lt!193142 (readBitPure!0 (_1!5453 lt!193143)))))

(declare-fun reader!0 (BitStream!4388 BitStream!4388) tuple2!10376)

(assert (=> b!122708 (= lt!193133 (reader!0 (_2!5454 lt!193141) (_2!5454 lt!193145)))))

(assert (=> b!122708 (= lt!193143 (reader!0 thiss!1305 (_2!5454 lt!193145)))))

(assert (=> b!122708 e!80434))

(declare-fun res!101707 () Bool)

(assert (=> b!122708 (=> (not res!101707) (not e!80434))))

(assert (=> b!122708 (= res!101707 (= (bitIndex!0 (size!2457 (buf!2897 (_1!5456 lt!193129))) (currentByte!5594 (_1!5456 lt!193129)) (currentBit!5589 (_1!5456 lt!193129))) (bitIndex!0 (size!2457 (buf!2897 (_1!5456 lt!193122))) (currentByte!5594 (_1!5456 lt!193122)) (currentBit!5589 (_1!5456 lt!193122)))))))

(declare-fun lt!193130 () Unit!7553)

(declare-fun lt!193127 () BitStream!4388)

(declare-fun readBitPrefixLemma!0 (BitStream!4388 BitStream!4388) Unit!7553)

(assert (=> b!122708 (= lt!193130 (readBitPrefixLemma!0 lt!193127 (_2!5454 lt!193145)))))

(assert (=> b!122708 (= lt!193122 (readBitPure!0 (BitStream!4389 (buf!2897 (_2!5454 lt!193145)) (currentByte!5594 thiss!1305) (currentBit!5589 thiss!1305))))))

(assert (=> b!122708 (= lt!193129 (readBitPure!0 lt!193127))))

(assert (=> b!122708 (= lt!193127 (BitStream!4389 (buf!2897 (_2!5454 lt!193141)) (currentByte!5594 thiss!1305) (currentBit!5589 thiss!1305)))))

(assert (=> b!122708 e!80436))

(declare-fun res!101706 () Bool)

(assert (=> b!122708 (=> (not res!101706) (not e!80436))))

(declare-fun isPrefixOf!0 (BitStream!4388 BitStream!4388) Bool)

(assert (=> b!122708 (= res!101706 (isPrefixOf!0 thiss!1305 (_2!5454 lt!193145)))))

(declare-fun lt!193126 () Unit!7553)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4388 BitStream!4388 BitStream!4388) Unit!7553)

(assert (=> b!122708 (= lt!193126 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5454 lt!193141) (_2!5454 lt!193145)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4388 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10378)

(assert (=> b!122708 (= lt!193145 (appendNLeastSignificantBitsLoop!0 (_2!5454 lt!193141) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!122708 e!80429))

(declare-fun res!101709 () Bool)

(assert (=> b!122708 (=> (not res!101709) (not e!80429))))

(assert (=> b!122708 (= res!101709 (= (size!2457 (buf!2897 thiss!1305)) (size!2457 (buf!2897 (_2!5454 lt!193141)))))))

(declare-fun appendBit!0 (BitStream!4388 Bool) tuple2!10378)

(assert (=> b!122708 (= lt!193141 (appendBit!0 thiss!1305 lt!193123))))

(assert (=> b!122708 (= lt!193123 (not (= (bvand v!199 lt!193139) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122708 (= lt!193139 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122709 () Bool)

(declare-fun e!80437 () Bool)

(declare-fun array_inv!2259 (array!5430) Bool)

(assert (=> b!122709 (= e!80437 (array_inv!2259 (buf!2897 thiss!1305)))))

(declare-fun b!122710 () Bool)

(declare-fun e!80433 () Bool)

(assert (=> b!122710 (= e!80433 e!80431)))

(declare-fun res!101710 () Bool)

(assert (=> b!122710 (=> (not res!101710) (not e!80431))))

(assert (=> b!122710 (= res!101710 (validate_offset_bits!1 ((_ sign_extend 32) (size!2457 (buf!2897 thiss!1305))) ((_ sign_extend 32) (currentByte!5594 thiss!1305)) ((_ sign_extend 32) (currentBit!5589 thiss!1305)) lt!193128))))

(assert (=> b!122710 (= lt!193128 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122711 () Bool)

(declare-fun res!101703 () Bool)

(assert (=> b!122711 (=> (not res!101703) (not e!80435))))

(assert (=> b!122711 (= res!101703 (isPrefixOf!0 thiss!1305 (_2!5454 lt!193141)))))

(declare-fun b!122712 () Bool)

(declare-fun res!101713 () Bool)

(assert (=> b!122712 (=> (not res!101713) (not e!80436))))

(assert (=> b!122712 (= res!101713 (invariant!0 (currentBit!5589 thiss!1305) (currentByte!5594 thiss!1305) (size!2457 (buf!2897 (_2!5454 lt!193141)))))))

(declare-fun b!122713 () Bool)

(assert (=> b!122713 (= e!80439 (and (= lt!193125 (bvsub lt!193121 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5453 lt!193133) lt!193147)) (and (= (_2!5455 lt!193138) (_2!5455 lt!193134)) (= (_1!5455 lt!193138) (_2!5453 lt!193143))))))))

(declare-fun res!101714 () Bool)

(assert (=> start!24180 (=> (not res!101714) (not e!80433))))

(assert (=> start!24180 (= res!101714 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24180 e!80433))

(assert (=> start!24180 true))

(declare-fun inv!12 (BitStream!4388) Bool)

(assert (=> start!24180 (and (inv!12 thiss!1305) e!80437)))

(declare-fun b!122704 () Bool)

(assert (=> b!122704 (= e!80435 e!80430)))

(declare-fun res!101711 () Bool)

(assert (=> b!122704 (=> (not res!101711) (not e!80430))))

(assert (=> b!122704 (= res!101711 (and (= (_2!5456 lt!193136) lt!193123) (= (_1!5456 lt!193136) (_2!5454 lt!193141))))))

(declare-fun readerFrom!0 (BitStream!4388 (_ BitVec 32) (_ BitVec 32)) BitStream!4388)

(assert (=> b!122704 (= lt!193136 (readBitPure!0 (readerFrom!0 (_2!5454 lt!193141) (currentBit!5589 thiss!1305) (currentByte!5594 thiss!1305))))))

(assert (= (and start!24180 res!101714) b!122710))

(assert (= (and b!122710 res!101710) b!122706))

(assert (= (and b!122706 res!101708) b!122701))

(assert (= (and b!122701 res!101712) b!122708))

(assert (= (and b!122708 res!101709) b!122703))

(assert (= (and b!122703 res!101704) b!122711))

(assert (= (and b!122711 res!101703) b!122704))

(assert (= (and b!122704 res!101711) b!122702))

(assert (= (and b!122708 res!101706) b!122712))

(assert (= (and b!122712 res!101713) b!122707))

(assert (= (and b!122708 res!101707) b!122705))

(assert (= (and b!122708 (not res!101715)) b!122700))

(assert (= (and b!122700 res!101705) b!122713))

(assert (= start!24180 b!122709))

(declare-fun m!186417 () Bool)

(assert (=> b!122709 m!186417))

(declare-fun m!186419 () Bool)

(assert (=> b!122712 m!186419))

(declare-fun m!186421 () Bool)

(assert (=> b!122711 m!186421))

(declare-fun m!186423 () Bool)

(assert (=> b!122710 m!186423))

(declare-fun m!186425 () Bool)

(assert (=> b!122700 m!186425))

(declare-fun m!186427 () Bool)

(assert (=> b!122700 m!186427))

(declare-fun m!186429 () Bool)

(assert (=> b!122700 m!186429))

(declare-fun m!186431 () Bool)

(assert (=> b!122700 m!186431))

(declare-fun m!186433 () Bool)

(assert (=> b!122700 m!186433))

(declare-fun m!186435 () Bool)

(assert (=> b!122700 m!186435))

(declare-fun m!186437 () Bool)

(assert (=> b!122700 m!186437))

(declare-fun m!186439 () Bool)

(assert (=> b!122700 m!186439))

(declare-fun m!186441 () Bool)

(assert (=> b!122704 m!186441))

(assert (=> b!122704 m!186441))

(declare-fun m!186443 () Bool)

(assert (=> b!122704 m!186443))

(declare-fun m!186445 () Bool)

(assert (=> b!122702 m!186445))

(assert (=> b!122703 m!186431))

(assert (=> b!122703 m!186439))

(declare-fun m!186447 () Bool)

(assert (=> b!122706 m!186447))

(declare-fun m!186449 () Bool)

(assert (=> b!122707 m!186449))

(declare-fun m!186451 () Bool)

(assert (=> start!24180 m!186451))

(declare-fun m!186453 () Bool)

(assert (=> b!122708 m!186453))

(declare-fun m!186455 () Bool)

(assert (=> b!122708 m!186455))

(declare-fun m!186457 () Bool)

(assert (=> b!122708 m!186457))

(declare-fun m!186459 () Bool)

(assert (=> b!122708 m!186459))

(declare-fun m!186461 () Bool)

(assert (=> b!122708 m!186461))

(declare-fun m!186463 () Bool)

(assert (=> b!122708 m!186463))

(declare-fun m!186465 () Bool)

(assert (=> b!122708 m!186465))

(declare-fun m!186467 () Bool)

(assert (=> b!122708 m!186467))

(declare-fun m!186469 () Bool)

(assert (=> b!122708 m!186469))

(declare-fun m!186471 () Bool)

(assert (=> b!122708 m!186471))

(declare-fun m!186473 () Bool)

(assert (=> b!122708 m!186473))

(declare-fun m!186475 () Bool)

(assert (=> b!122708 m!186475))

(declare-fun m!186477 () Bool)

(assert (=> b!122708 m!186477))

(declare-fun m!186479 () Bool)

(assert (=> b!122708 m!186479))

(declare-fun m!186481 () Bool)

(assert (=> b!122708 m!186481))

(declare-fun m!186483 () Bool)

(assert (=> b!122708 m!186483))

(declare-fun m!186485 () Bool)

(assert (=> b!122708 m!186485))

(declare-fun m!186487 () Bool)

(assert (=> b!122708 m!186487))

(declare-fun m!186489 () Bool)

(assert (=> b!122708 m!186489))

(push 1)

