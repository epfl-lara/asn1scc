; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13264 () Bool)

(assert start!13264)

(declare-fun b!68028 () Bool)

(declare-fun res!56298 () Bool)

(declare-fun e!44533 () Bool)

(assert (=> b!68028 (=> (not res!56298) (not e!44533))))

(declare-datatypes ((array!2879 0))(
  ( (array!2880 (arr!1906 (Array (_ BitVec 32) (_ BitVec 8))) (size!1333 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2282 0))(
  ( (BitStream!2283 (buf!1714 array!2879) (currentByte!3404 (_ BitVec 32)) (currentBit!3399 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2282)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!68028 (= res!56298 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 thiss!1379))) ((_ sign_extend 32) (currentByte!3404 thiss!1379)) ((_ sign_extend 32) (currentBit!3399 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!68029 () Bool)

(declare-fun res!56287 () Bool)

(declare-fun e!44524 () Bool)

(assert (=> b!68029 (=> res!56287 e!44524)))

(declare-datatypes ((Unit!4575 0))(
  ( (Unit!4576) )
))
(declare-datatypes ((tuple2!5972 0))(
  ( (tuple2!5973 (_1!3097 Unit!4575) (_2!3097 BitStream!2282)) )
))
(declare-fun lt!108678 () tuple2!5972)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!68029 (= res!56287 (not (invariant!0 (currentBit!3399 (_2!3097 lt!108678)) (currentByte!3404 (_2!3097 lt!108678)) (size!1333 (buf!1714 (_2!3097 lt!108678))))))))

(declare-fun srcBuffer!2 () array!2879)

(declare-fun e!44536 () Bool)

(declare-fun b!68030 () Bool)

(declare-datatypes ((tuple2!5974 0))(
  ( (tuple2!5975 (_1!3098 BitStream!2282) (_2!3098 BitStream!2282)) )
))
(declare-fun lt!108679 () tuple2!5974)

(declare-datatypes ((List!716 0))(
  ( (Nil!713) (Cons!712 (h!831 Bool) (t!1466 List!716)) )
))
(declare-fun head!535 (List!716) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2282 array!2879 (_ BitVec 64) (_ BitVec 64)) List!716)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2282 BitStream!2282 (_ BitVec 64)) List!716)

(assert (=> b!68030 (= e!44536 (= (head!535 (byteArrayBitContentToList!0 (_2!3097 lt!108678) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!535 (bitStreamReadBitsIntoList!0 (_2!3097 lt!108678) (_1!3098 lt!108679) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!68031 () Bool)

(declare-fun e!44534 () Bool)

(assert (=> b!68031 (= e!44533 (not e!44534))))

(declare-fun res!56295 () Bool)

(assert (=> b!68031 (=> res!56295 e!44534)))

(assert (=> b!68031 (= res!56295 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2282 BitStream!2282) Bool)

(assert (=> b!68031 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!108668 () Unit!4575)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2282) Unit!4575)

(assert (=> b!68031 (= lt!108668 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!108673 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!68031 (= lt!108673 (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379)))))

(declare-fun b!68032 () Bool)

(declare-fun res!56289 () Bool)

(assert (=> b!68032 (=> res!56289 e!44524)))

(declare-fun lt!108665 () tuple2!5972)

(assert (=> b!68032 (= res!56289 (not (invariant!0 (currentBit!3399 (_2!3097 lt!108678)) (currentByte!3404 (_2!3097 lt!108678)) (size!1333 (buf!1714 (_2!3097 lt!108665))))))))

(declare-fun b!68033 () Bool)

(declare-fun res!56283 () Bool)

(declare-fun e!44525 () Bool)

(assert (=> b!68033 (=> res!56283 e!44525)))

(declare-fun lt!108662 () List!716)

(declare-fun lt!108669 () Bool)

(assert (=> b!68033 (= res!56283 (not (= (head!535 lt!108662) lt!108669)))))

(declare-fun b!68034 () Bool)

(declare-fun e!44529 () Bool)

(declare-fun lt!108680 () (_ BitVec 64))

(assert (=> b!68034 (= e!44529 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!108680))))

(declare-fun b!68035 () Bool)

(declare-fun e!44530 () Bool)

(declare-fun array_inv!1200 (array!2879) Bool)

(assert (=> b!68035 (= e!44530 (array_inv!1200 (buf!1714 thiss!1379)))))

(declare-fun b!68037 () Bool)

(declare-fun res!56294 () Bool)

(declare-fun e!44532 () Bool)

(assert (=> b!68037 (=> res!56294 e!44532)))

(declare-fun length!344 (List!716) Int)

(assert (=> b!68037 (= res!56294 (<= (length!344 lt!108662) 0))))

(declare-fun b!68038 () Bool)

(declare-fun res!56301 () Bool)

(declare-fun e!44528 () Bool)

(assert (=> b!68038 (=> res!56301 e!44528)))

(assert (=> b!68038 (= res!56301 (not (invariant!0 (currentBit!3399 (_2!3097 lt!108665)) (currentByte!3404 (_2!3097 lt!108665)) (size!1333 (buf!1714 (_2!3097 lt!108665))))))))

(declare-fun b!68039 () Bool)

(declare-fun e!44535 () Bool)

(assert (=> b!68039 (= e!44534 e!44535)))

(declare-fun res!56297 () Bool)

(assert (=> b!68039 (=> res!56297 e!44535)))

(assert (=> b!68039 (= res!56297 (not (isPrefixOf!0 thiss!1379 (_2!3097 lt!108678))))))

(declare-fun lt!108667 () (_ BitVec 64))

(assert (=> b!68039 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108678)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678))) lt!108667)))

(assert (=> b!68039 (= lt!108667 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!108682 () Unit!4575)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2282 BitStream!2282 (_ BitVec 64) (_ BitVec 64)) Unit!4575)

(assert (=> b!68039 (= lt!108682 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3097 lt!108678) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2282 (_ BitVec 8) (_ BitVec 32)) tuple2!5972)

(assert (=> b!68039 (= lt!108678 (appendBitFromByte!0 thiss!1379 (select (arr!1906 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!68040 () Bool)

(declare-fun res!56293 () Bool)

(assert (=> b!68040 (=> res!56293 e!44528)))

(assert (=> b!68040 (= res!56293 (not (= (size!1333 (buf!1714 thiss!1379)) (size!1333 (buf!1714 (_2!3097 lt!108665))))))))

(declare-fun b!68041 () Bool)

(declare-fun e!44531 () Bool)

(assert (=> b!68041 (= e!44531 e!44528)))

(declare-fun res!56299 () Bool)

(assert (=> b!68041 (=> res!56299 e!44528)))

(declare-fun lt!108677 () (_ BitVec 64))

(assert (=> b!68041 (= res!56299 (not (= lt!108677 (bvsub (bvadd lt!108673 to!314) i!635))))))

(assert (=> b!68041 (= lt!108677 (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108665))) (currentByte!3404 (_2!3097 lt!108665)) (currentBit!3399 (_2!3097 lt!108665))))))

(declare-fun b!68042 () Bool)

(assert (=> b!68042 (= e!44524 e!44532)))

(declare-fun res!56288 () Bool)

(assert (=> b!68042 (=> res!56288 e!44532)))

(assert (=> b!68042 (= res!56288 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!108681 () tuple2!5974)

(declare-fun lt!108663 () List!716)

(assert (=> b!68042 (= lt!108663 (bitStreamReadBitsIntoList!0 (_2!3097 lt!108665) (_1!3098 lt!108681) lt!108667))))

(declare-fun lt!108674 () tuple2!5974)

(assert (=> b!68042 (= lt!108662 (bitStreamReadBitsIntoList!0 (_2!3097 lt!108665) (_1!3098 lt!108674) (bvsub to!314 i!635)))))

(assert (=> b!68042 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108665)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678))) lt!108667)))

(declare-fun lt!108670 () Unit!4575)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2282 array!2879 (_ BitVec 64)) Unit!4575)

(assert (=> b!68042 (= lt!108670 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3097 lt!108678) (buf!1714 (_2!3097 lt!108665)) lt!108667))))

(declare-fun reader!0 (BitStream!2282 BitStream!2282) tuple2!5974)

(assert (=> b!68042 (= lt!108681 (reader!0 (_2!3097 lt!108678) (_2!3097 lt!108665)))))

(assert (=> b!68042 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108665)))) ((_ sign_extend 32) (currentByte!3404 thiss!1379)) ((_ sign_extend 32) (currentBit!3399 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!108675 () Unit!4575)

(assert (=> b!68042 (= lt!108675 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1714 (_2!3097 lt!108665)) (bvsub to!314 i!635)))))

(assert (=> b!68042 (= lt!108674 (reader!0 thiss!1379 (_2!3097 lt!108665)))))

(declare-fun b!68043 () Bool)

(assert (=> b!68043 (= e!44528 e!44524)))

(declare-fun res!56296 () Bool)

(assert (=> b!68043 (=> res!56296 e!44524)))

(assert (=> b!68043 (= res!56296 (not (= (size!1333 (buf!1714 (_2!3097 lt!108678))) (size!1333 (buf!1714 (_2!3097 lt!108665))))))))

(assert (=> b!68043 (= lt!108677 (bvsub (bvsub (bvadd lt!108680 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!68043 (= lt!108680 (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108678))) (currentByte!3404 (_2!3097 lt!108678)) (currentBit!3399 (_2!3097 lt!108678))))))

(assert (=> b!68043 (= (size!1333 (buf!1714 (_2!3097 lt!108665))) (size!1333 (buf!1714 thiss!1379)))))

(declare-fun b!68044 () Bool)

(assert (=> b!68044 (= e!44525 e!44529)))

(declare-fun res!56285 () Bool)

(assert (=> b!68044 (=> res!56285 e!44529)))

(declare-fun lt!108666 () Bool)

(assert (=> b!68044 (= res!56285 (not (= (head!535 (byteArrayBitContentToList!0 (_2!3097 lt!108665) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!108666)))))

(declare-fun bitAt!0 (array!2879 (_ BitVec 64)) Bool)

(assert (=> b!68044 (= lt!108666 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!68045 () Bool)

(declare-fun e!44527 () Bool)

(assert (=> b!68045 (= e!44532 e!44527)))

(declare-fun res!56300 () Bool)

(assert (=> b!68045 (=> res!56300 e!44527)))

(declare-fun lt!108671 () List!716)

(assert (=> b!68045 (= res!56300 (not (= lt!108671 lt!108663)))))

(assert (=> b!68045 (= lt!108663 lt!108671)))

(declare-fun tail!320 (List!716) List!716)

(assert (=> b!68045 (= lt!108671 (tail!320 lt!108662))))

(declare-fun lt!108672 () Unit!4575)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2282 BitStream!2282 BitStream!2282 BitStream!2282 (_ BitVec 64) List!716) Unit!4575)

(assert (=> b!68045 (= lt!108672 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3097 lt!108665) (_2!3097 lt!108665) (_1!3098 lt!108674) (_1!3098 lt!108681) (bvsub to!314 i!635) lt!108662))))

(declare-fun b!68046 () Bool)

(assert (=> b!68046 (= e!44527 e!44525)))

(declare-fun res!56291 () Bool)

(assert (=> b!68046 (=> res!56291 e!44525)))

(assert (=> b!68046 (= res!56291 (not (= lt!108669 (bitAt!0 (buf!1714 (_1!3098 lt!108681)) lt!108673))))))

(assert (=> b!68046 (= lt!108669 (bitAt!0 (buf!1714 (_1!3098 lt!108674)) lt!108673))))

(declare-fun b!68047 () Bool)

(declare-fun res!56284 () Bool)

(assert (=> b!68047 (=> res!56284 e!44529)))

(assert (=> b!68047 (= res!56284 (not (= (bitAt!0 (buf!1714 (_2!3097 lt!108678)) lt!108673) lt!108666)))))

(declare-fun b!68036 () Bool)

(assert (=> b!68036 (= e!44535 e!44531)))

(declare-fun res!56286 () Bool)

(assert (=> b!68036 (=> res!56286 e!44531)))

(assert (=> b!68036 (= res!56286 (not (isPrefixOf!0 (_2!3097 lt!108678) (_2!3097 lt!108665))))))

(assert (=> b!68036 (isPrefixOf!0 thiss!1379 (_2!3097 lt!108665))))

(declare-fun lt!108676 () Unit!4575)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2282 BitStream!2282 BitStream!2282) Unit!4575)

(assert (=> b!68036 (= lt!108676 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3097 lt!108678) (_2!3097 lt!108665)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2282 array!2879 (_ BitVec 64) (_ BitVec 64)) tuple2!5972)

(assert (=> b!68036 (= lt!108665 (appendBitsMSBFirstLoop!0 (_2!3097 lt!108678) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!68036 e!44536))

(declare-fun res!56292 () Bool)

(assert (=> b!68036 (=> (not res!56292) (not e!44536))))

(assert (=> b!68036 (= res!56292 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108678)))) ((_ sign_extend 32) (currentByte!3404 thiss!1379)) ((_ sign_extend 32) (currentBit!3399 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!108664 () Unit!4575)

(assert (=> b!68036 (= lt!108664 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1714 (_2!3097 lt!108678)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!68036 (= lt!108679 (reader!0 thiss!1379 (_2!3097 lt!108678)))))

(declare-fun res!56290 () Bool)

(assert (=> start!13264 (=> (not res!56290) (not e!44533))))

(assert (=> start!13264 (= res!56290 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1333 srcBuffer!2))))))))

(assert (=> start!13264 e!44533))

(assert (=> start!13264 true))

(assert (=> start!13264 (array_inv!1200 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2282) Bool)

(assert (=> start!13264 (and (inv!12 thiss!1379) e!44530)))

(assert (= (and start!13264 res!56290) b!68028))

(assert (= (and b!68028 res!56298) b!68031))

(assert (= (and b!68031 (not res!56295)) b!68039))

(assert (= (and b!68039 (not res!56297)) b!68036))

(assert (= (and b!68036 res!56292) b!68030))

(assert (= (and b!68036 (not res!56286)) b!68041))

(assert (= (and b!68041 (not res!56299)) b!68038))

(assert (= (and b!68038 (not res!56301)) b!68040))

(assert (= (and b!68040 (not res!56293)) b!68043))

(assert (= (and b!68043 (not res!56296)) b!68029))

(assert (= (and b!68029 (not res!56287)) b!68032))

(assert (= (and b!68032 (not res!56289)) b!68042))

(assert (= (and b!68042 (not res!56288)) b!68037))

(assert (= (and b!68037 (not res!56294)) b!68045))

(assert (= (and b!68045 (not res!56300)) b!68046))

(assert (= (and b!68046 (not res!56291)) b!68033))

(assert (= (and b!68033 (not res!56283)) b!68044))

(assert (= (and b!68044 (not res!56285)) b!68047))

(assert (= (and b!68047 (not res!56284)) b!68034))

(assert (= start!13264 b!68035))

(declare-fun m!108479 () Bool)

(assert (=> b!68038 m!108479))

(declare-fun m!108481 () Bool)

(assert (=> b!68037 m!108481))

(declare-fun m!108483 () Bool)

(assert (=> b!68047 m!108483))

(declare-fun m!108485 () Bool)

(assert (=> b!68032 m!108485))

(declare-fun m!108487 () Bool)

(assert (=> b!68039 m!108487))

(declare-fun m!108489 () Bool)

(assert (=> b!68039 m!108489))

(declare-fun m!108491 () Bool)

(assert (=> b!68039 m!108491))

(declare-fun m!108493 () Bool)

(assert (=> b!68039 m!108493))

(assert (=> b!68039 m!108489))

(declare-fun m!108495 () Bool)

(assert (=> b!68039 m!108495))

(declare-fun m!108497 () Bool)

(assert (=> b!68043 m!108497))

(declare-fun m!108499 () Bool)

(assert (=> b!68042 m!108499))

(declare-fun m!108501 () Bool)

(assert (=> b!68042 m!108501))

(declare-fun m!108503 () Bool)

(assert (=> b!68042 m!108503))

(declare-fun m!108505 () Bool)

(assert (=> b!68042 m!108505))

(declare-fun m!108507 () Bool)

(assert (=> b!68042 m!108507))

(declare-fun m!108509 () Bool)

(assert (=> b!68042 m!108509))

(declare-fun m!108511 () Bool)

(assert (=> b!68042 m!108511))

(declare-fun m!108513 () Bool)

(assert (=> b!68042 m!108513))

(declare-fun m!108515 () Bool)

(assert (=> b!68046 m!108515))

(declare-fun m!108517 () Bool)

(assert (=> b!68046 m!108517))

(declare-fun m!108519 () Bool)

(assert (=> b!68036 m!108519))

(declare-fun m!108521 () Bool)

(assert (=> b!68036 m!108521))

(declare-fun m!108523 () Bool)

(assert (=> b!68036 m!108523))

(declare-fun m!108525 () Bool)

(assert (=> b!68036 m!108525))

(declare-fun m!108527 () Bool)

(assert (=> b!68036 m!108527))

(declare-fun m!108529 () Bool)

(assert (=> b!68036 m!108529))

(declare-fun m!108531 () Bool)

(assert (=> b!68036 m!108531))

(declare-fun m!108533 () Bool)

(assert (=> b!68029 m!108533))

(declare-fun m!108535 () Bool)

(assert (=> b!68041 m!108535))

(declare-fun m!108537 () Bool)

(assert (=> b!68033 m!108537))

(declare-fun m!108539 () Bool)

(assert (=> b!68045 m!108539))

(declare-fun m!108541 () Bool)

(assert (=> b!68045 m!108541))

(declare-fun m!108543 () Bool)

(assert (=> start!13264 m!108543))

(declare-fun m!108545 () Bool)

(assert (=> start!13264 m!108545))

(declare-fun m!108547 () Bool)

(assert (=> b!68028 m!108547))

(declare-fun m!108549 () Bool)

(assert (=> b!68044 m!108549))

(assert (=> b!68044 m!108549))

(declare-fun m!108551 () Bool)

(assert (=> b!68044 m!108551))

(declare-fun m!108553 () Bool)

(assert (=> b!68044 m!108553))

(declare-fun m!108555 () Bool)

(assert (=> b!68035 m!108555))

(declare-fun m!108557 () Bool)

(assert (=> b!68030 m!108557))

(assert (=> b!68030 m!108557))

(declare-fun m!108559 () Bool)

(assert (=> b!68030 m!108559))

(declare-fun m!108561 () Bool)

(assert (=> b!68030 m!108561))

(assert (=> b!68030 m!108561))

(declare-fun m!108563 () Bool)

(assert (=> b!68030 m!108563))

(declare-fun m!108565 () Bool)

(assert (=> b!68031 m!108565))

(declare-fun m!108567 () Bool)

(assert (=> b!68031 m!108567))

(declare-fun m!108569 () Bool)

(assert (=> b!68031 m!108569))

(push 1)

(assert (not b!68043))

(assert (not b!68045))

(assert (not b!68047))

(assert (not b!68035))

(assert (not b!68029))

(assert (not b!68038))

(assert (not b!68039))

(assert (not b!68037))

(assert (not b!68031))

(assert (not b!68041))

(assert (not b!68042))

(assert (not b!68044))

(assert (not b!68030))

(assert (not start!13264))

(assert (not b!68046))

(assert (not b!68036))

(assert (not b!68033))

(assert (not b!68028))

(assert (not b!68032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!21592 () Bool)

(assert (=> d!21592 (= (bitAt!0 (buf!1714 (_2!3097 lt!108678)) lt!108673) (not (= (bvand ((_ sign_extend 24) (select (arr!1906 (buf!1714 (_2!3097 lt!108678))) ((_ extract 31 0) (bvsdiv lt!108673 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!108673 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5220 () Bool)

(assert (= bs!5220 d!21592))

(declare-fun m!108607 () Bool)

(assert (=> bs!5220 m!108607))

(declare-fun m!108609 () Bool)

(assert (=> bs!5220 m!108609))

(assert (=> b!68047 d!21592))

(declare-fun d!21594 () Bool)

(declare-fun res!56331 () Bool)

(declare-fun e!44556 () Bool)

(assert (=> d!21594 (=> (not res!56331) (not e!44556))))

(assert (=> d!21594 (= res!56331 (= (size!1333 (buf!1714 thiss!1379)) (size!1333 (buf!1714 (_2!3097 lt!108665)))))))

(assert (=> d!21594 (= (isPrefixOf!0 thiss!1379 (_2!3097 lt!108665)) e!44556)))

(declare-fun b!68081 () Bool)

(declare-fun res!56330 () Bool)

(assert (=> b!68081 (=> (not res!56330) (not e!44556))))

(assert (=> b!68081 (= res!56330 (bvsle (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379)) (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108665))) (currentByte!3404 (_2!3097 lt!108665)) (currentBit!3399 (_2!3097 lt!108665)))))))

(declare-fun b!68082 () Bool)

(declare-fun e!44557 () Bool)

(assert (=> b!68082 (= e!44556 e!44557)))

(declare-fun res!56329 () Bool)

(assert (=> b!68082 (=> res!56329 e!44557)))

(assert (=> b!68082 (= res!56329 (= (size!1333 (buf!1714 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!68083 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2879 array!2879 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!68083 (= e!44557 (arrayBitRangesEq!0 (buf!1714 thiss!1379) (buf!1714 (_2!3097 lt!108665)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379))))))

(assert (= (and d!21594 res!56331) b!68081))

(assert (= (and b!68081 res!56330) b!68082))

(assert (= (and b!68082 (not res!56329)) b!68083))

(assert (=> b!68081 m!108569))

(assert (=> b!68081 m!108535))

(assert (=> b!68083 m!108569))

(assert (=> b!68083 m!108569))

(declare-fun m!108611 () Bool)

(assert (=> b!68083 m!108611))

(assert (=> b!68036 d!21594))

(declare-fun d!21596 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!21596 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108678)))) ((_ sign_extend 32) (currentByte!3404 thiss!1379)) ((_ sign_extend 32) (currentBit!3399 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108678)))) ((_ sign_extend 32) (currentByte!3404 thiss!1379)) ((_ sign_extend 32) (currentBit!3399 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5221 () Bool)

(assert (= bs!5221 d!21596))

(declare-fun m!108613 () Bool)

(assert (=> bs!5221 m!108613))

(assert (=> b!68036 d!21596))

(declare-fun b!68188 () Bool)

(declare-fun e!44609 () tuple2!5972)

(declare-fun Unit!4585 () Unit!4575)

(assert (=> b!68188 (= e!44609 (tuple2!5973 Unit!4585 (_2!3097 lt!108678)))))

(assert (=> b!68188 (= (size!1333 (buf!1714 (_2!3097 lt!108678))) (size!1333 (buf!1714 (_2!3097 lt!108678))))))

(declare-fun lt!109136 () Unit!4575)

(declare-fun Unit!4586 () Unit!4575)

(assert (=> b!68188 (= lt!109136 Unit!4586)))

(declare-fun call!877 () tuple2!5974)

(declare-fun checkByteArrayBitContent!0 (BitStream!2282 array!2879 array!2879 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5980 0))(
  ( (tuple2!5981 (_1!3101 array!2879) (_2!3101 BitStream!2282)) )
))
(declare-fun readBits!0 (BitStream!2282 (_ BitVec 64)) tuple2!5980)

(assert (=> b!68188 (checkByteArrayBitContent!0 (_2!3097 lt!108678) srcBuffer!2 (_1!3101 (readBits!0 (_1!3098 call!877) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!68190 () Bool)

(declare-fun res!56404 () Bool)

(declare-fun e!44610 () Bool)

(assert (=> b!68190 (=> (not res!56404) (not e!44610))))

(declare-fun lt!109121 () tuple2!5972)

(assert (=> b!68190 (= res!56404 (= (size!1333 (buf!1714 (_2!3097 lt!108678))) (size!1333 (buf!1714 (_2!3097 lt!109121)))))))

(declare-fun b!68191 () Bool)

(declare-fun e!44608 () Bool)

(declare-fun lt!109129 () (_ BitVec 64))

(assert (=> b!68191 (= e!44608 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108678)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678))) lt!109129))))

(declare-fun lt!109120 () tuple2!5974)

(declare-fun b!68192 () Bool)

(assert (=> b!68192 (= e!44610 (= (bitStreamReadBitsIntoList!0 (_2!3097 lt!109121) (_1!3098 lt!109120) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3097 lt!109121) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!68192 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68192 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!109127 () Unit!4575)

(declare-fun lt!109131 () Unit!4575)

(assert (=> b!68192 (= lt!109127 lt!109131)))

(assert (=> b!68192 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!109121)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678))) lt!109129)))

(assert (=> b!68192 (= lt!109131 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3097 lt!108678) (buf!1714 (_2!3097 lt!109121)) lt!109129))))

(assert (=> b!68192 e!44608))

(declare-fun res!56407 () Bool)

(assert (=> b!68192 (=> (not res!56407) (not e!44608))))

(assert (=> b!68192 (= res!56407 (and (= (size!1333 (buf!1714 (_2!3097 lt!108678))) (size!1333 (buf!1714 (_2!3097 lt!109121)))) (bvsge lt!109129 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68192 (= lt!109129 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!68192 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68192 (= lt!109120 (reader!0 (_2!3097 lt!108678) (_2!3097 lt!109121)))))

(declare-fun b!68193 () Bool)

(declare-fun res!56402 () Bool)

(assert (=> b!68193 (=> (not res!56402) (not e!44610))))

(assert (=> b!68193 (= res!56402 (isPrefixOf!0 (_2!3097 lt!108678) (_2!3097 lt!109121)))))

(declare-fun b!68194 () Bool)

(declare-fun res!56406 () Bool)

(assert (=> b!68194 (=> (not res!56406) (not e!44610))))

(assert (=> b!68194 (= res!56406 (invariant!0 (currentBit!3399 (_2!3097 lt!109121)) (currentByte!3404 (_2!3097 lt!109121)) (size!1333 (buf!1714 (_2!3097 lt!109121)))))))

(declare-fun d!21598 () Bool)

(assert (=> d!21598 e!44610))

(declare-fun res!56405 () Bool)

(assert (=> d!21598 (=> (not res!56405) (not e!44610))))

(declare-fun lt!109108 () (_ BitVec 64))

(assert (=> d!21598 (= res!56405 (= (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!109121))) (currentByte!3404 (_2!3097 lt!109121)) (currentBit!3399 (_2!3097 lt!109121))) (bvsub lt!109108 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!21598 (or (= (bvand lt!109108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109108 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!109135 () (_ BitVec 64))

(assert (=> d!21598 (= lt!109108 (bvadd lt!109135 to!314))))

(assert (=> d!21598 (or (not (= (bvand lt!109135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!109135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!109135 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21598 (= lt!109135 (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108678))) (currentByte!3404 (_2!3097 lt!108678)) (currentBit!3399 (_2!3097 lt!108678))))))

(assert (=> d!21598 (= lt!109121 e!44609)))

(declare-fun c!5013 () Bool)

(assert (=> d!21598 (= c!5013 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!109109 () Unit!4575)

(declare-fun lt!109116 () Unit!4575)

(assert (=> d!21598 (= lt!109109 lt!109116)))

(assert (=> d!21598 (isPrefixOf!0 (_2!3097 lt!108678) (_2!3097 lt!108678))))

(assert (=> d!21598 (= lt!109116 (lemmaIsPrefixRefl!0 (_2!3097 lt!108678)))))

(declare-fun lt!109138 () (_ BitVec 64))

(assert (=> d!21598 (= lt!109138 (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108678))) (currentByte!3404 (_2!3097 lt!108678)) (currentBit!3399 (_2!3097 lt!108678))))))

(assert (=> d!21598 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21598 (= (appendBitsMSBFirstLoop!0 (_2!3097 lt!108678) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!109121)))

(declare-fun b!68189 () Bool)

(declare-fun res!56403 () Bool)

(assert (=> b!68189 (=> (not res!56403) (not e!44610))))

(assert (=> b!68189 (= res!56403 (= (size!1333 (buf!1714 (_2!3097 lt!109121))) (size!1333 (buf!1714 (_2!3097 lt!108678)))))))

(declare-fun lt!109130 () tuple2!5972)

(declare-fun bm!874 () Bool)

(assert (=> bm!874 (= call!877 (reader!0 (_2!3097 lt!108678) (ite c!5013 (_2!3097 lt!109130) (_2!3097 lt!108678))))))

(declare-fun b!68195 () Bool)

(declare-fun lt!109132 () tuple2!5972)

(declare-fun Unit!4587 () Unit!4575)

(assert (=> b!68195 (= e!44609 (tuple2!5973 Unit!4587 (_2!3097 lt!109132)))))

(assert (=> b!68195 (= lt!109130 (appendBitFromByte!0 (_2!3097 lt!108678) (select (arr!1906 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!109117 () (_ BitVec 64))

(assert (=> b!68195 (= lt!109117 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!109122 () (_ BitVec 64))

(assert (=> b!68195 (= lt!109122 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!109133 () Unit!4575)

(assert (=> b!68195 (= lt!109133 (validateOffsetBitsIneqLemma!0 (_2!3097 lt!108678) (_2!3097 lt!109130) lt!109117 lt!109122))))

(assert (=> b!68195 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!109130)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!109130))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!109130))) (bvsub lt!109117 lt!109122))))

(declare-fun lt!109101 () Unit!4575)

(assert (=> b!68195 (= lt!109101 lt!109133)))

(declare-fun lt!109142 () tuple2!5974)

(assert (=> b!68195 (= lt!109142 call!877)))

(declare-fun lt!109126 () (_ BitVec 64))

(assert (=> b!68195 (= lt!109126 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!109118 () Unit!4575)

(assert (=> b!68195 (= lt!109118 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3097 lt!108678) (buf!1714 (_2!3097 lt!109130)) lt!109126))))

(assert (=> b!68195 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!109130)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678))) lt!109126)))

(declare-fun lt!109103 () Unit!4575)

(assert (=> b!68195 (= lt!109103 lt!109118)))

(assert (=> b!68195 (= (head!535 (byteArrayBitContentToList!0 (_2!3097 lt!109130) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!535 (bitStreamReadBitsIntoList!0 (_2!3097 lt!109130) (_1!3098 lt!109142) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!109134 () Unit!4575)

(declare-fun Unit!4588 () Unit!4575)

(assert (=> b!68195 (= lt!109134 Unit!4588)))

(assert (=> b!68195 (= lt!109132 (appendBitsMSBFirstLoop!0 (_2!3097 lt!109130) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!109139 () Unit!4575)

(assert (=> b!68195 (= lt!109139 (lemmaIsPrefixTransitive!0 (_2!3097 lt!108678) (_2!3097 lt!109130) (_2!3097 lt!109132)))))

(assert (=> b!68195 (isPrefixOf!0 (_2!3097 lt!108678) (_2!3097 lt!109132))))

(declare-fun lt!109115 () Unit!4575)

(assert (=> b!68195 (= lt!109115 lt!109139)))

(assert (=> b!68195 (= (size!1333 (buf!1714 (_2!3097 lt!109132))) (size!1333 (buf!1714 (_2!3097 lt!108678))))))

(declare-fun lt!109143 () Unit!4575)

(declare-fun Unit!4589 () Unit!4575)

(assert (=> b!68195 (= lt!109143 Unit!4589)))

(assert (=> b!68195 (= (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!109132))) (currentByte!3404 (_2!3097 lt!109132)) (currentBit!3399 (_2!3097 lt!109132))) (bvsub (bvadd (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108678))) (currentByte!3404 (_2!3097 lt!108678)) (currentBit!3399 (_2!3097 lt!108678))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!109140 () Unit!4575)

(declare-fun Unit!4590 () Unit!4575)

(assert (=> b!68195 (= lt!109140 Unit!4590)))

(assert (=> b!68195 (= (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!109132))) (currentByte!3404 (_2!3097 lt!109132)) (currentBit!3399 (_2!3097 lt!109132))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!109130))) (currentByte!3404 (_2!3097 lt!109130)) (currentBit!3399 (_2!3097 lt!109130))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109137 () Unit!4575)

(declare-fun Unit!4591 () Unit!4575)

(assert (=> b!68195 (= lt!109137 Unit!4591)))

(declare-fun lt!109119 () tuple2!5974)

(assert (=> b!68195 (= lt!109119 (reader!0 (_2!3097 lt!108678) (_2!3097 lt!109132)))))

(declare-fun lt!109106 () (_ BitVec 64))

(assert (=> b!68195 (= lt!109106 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!109102 () Unit!4575)

(assert (=> b!68195 (= lt!109102 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3097 lt!108678) (buf!1714 (_2!3097 lt!109132)) lt!109106))))

(assert (=> b!68195 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!109132)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678))) lt!109106)))

(declare-fun lt!109125 () Unit!4575)

(assert (=> b!68195 (= lt!109125 lt!109102)))

(declare-fun lt!109100 () tuple2!5974)

(assert (=> b!68195 (= lt!109100 (reader!0 (_2!3097 lt!109130) (_2!3097 lt!109132)))))

(declare-fun lt!109110 () (_ BitVec 64))

(assert (=> b!68195 (= lt!109110 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109123 () Unit!4575)

(assert (=> b!68195 (= lt!109123 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3097 lt!109130) (buf!1714 (_2!3097 lt!109132)) lt!109110))))

(assert (=> b!68195 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!109132)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!109130))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!109130))) lt!109110)))

(declare-fun lt!109111 () Unit!4575)

(assert (=> b!68195 (= lt!109111 lt!109123)))

(declare-fun lt!109104 () List!716)

(assert (=> b!68195 (= lt!109104 (byteArrayBitContentToList!0 (_2!3097 lt!109132) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!109112 () List!716)

(assert (=> b!68195 (= lt!109112 (byteArrayBitContentToList!0 (_2!3097 lt!109132) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!109105 () List!716)

(assert (=> b!68195 (= lt!109105 (bitStreamReadBitsIntoList!0 (_2!3097 lt!109132) (_1!3098 lt!109119) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!109128 () List!716)

(assert (=> b!68195 (= lt!109128 (bitStreamReadBitsIntoList!0 (_2!3097 lt!109132) (_1!3098 lt!109100) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!109107 () (_ BitVec 64))

(assert (=> b!68195 (= lt!109107 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!109141 () Unit!4575)

(assert (=> b!68195 (= lt!109141 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3097 lt!109132) (_2!3097 lt!109132) (_1!3098 lt!109119) (_1!3098 lt!109100) lt!109107 lt!109105))))

(assert (=> b!68195 (= (bitStreamReadBitsIntoList!0 (_2!3097 lt!109132) (_1!3098 lt!109100) (bvsub lt!109107 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!320 lt!109105))))

(declare-fun lt!109113 () Unit!4575)

(assert (=> b!68195 (= lt!109113 lt!109141)))

(declare-fun lt!109124 () Unit!4575)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2879 array!2879 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4575)

(assert (=> b!68195 (= lt!109124 (arrayBitRangesEqImpliesEq!0 (buf!1714 (_2!3097 lt!109130)) (buf!1714 (_2!3097 lt!109132)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!109138 (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!109130))) (currentByte!3404 (_2!3097 lt!109130)) (currentBit!3399 (_2!3097 lt!109130)))))))

(assert (=> b!68195 (= (bitAt!0 (buf!1714 (_2!3097 lt!109130)) lt!109138) (bitAt!0 (buf!1714 (_2!3097 lt!109132)) lt!109138))))

(declare-fun lt!109114 () Unit!4575)

(assert (=> b!68195 (= lt!109114 lt!109124)))

(assert (= (and d!21598 c!5013) b!68195))

(assert (= (and d!21598 (not c!5013)) b!68188))

(assert (= (or b!68195 b!68188) bm!874))

(assert (= (and d!21598 res!56405) b!68194))

(assert (= (and b!68194 res!56406) b!68190))

(assert (= (and b!68190 res!56404) b!68193))

(assert (= (and b!68193 res!56402) b!68189))

(assert (= (and b!68189 res!56403) b!68192))

(assert (= (and b!68192 res!56407) b!68191))

(declare-fun m!108813 () Bool)

(assert (=> b!68193 m!108813))

(declare-fun m!108815 () Bool)

(assert (=> bm!874 m!108815))

(declare-fun m!108817 () Bool)

(assert (=> d!21598 m!108817))

(assert (=> d!21598 m!108497))

(declare-fun m!108819 () Bool)

(assert (=> d!21598 m!108819))

(declare-fun m!108821 () Bool)

(assert (=> d!21598 m!108821))

(declare-fun m!108823 () Bool)

(assert (=> b!68191 m!108823))

(declare-fun m!108825 () Bool)

(assert (=> b!68195 m!108825))

(declare-fun m!108827 () Bool)

(assert (=> b!68195 m!108827))

(declare-fun m!108829 () Bool)

(assert (=> b!68195 m!108829))

(declare-fun m!108831 () Bool)

(assert (=> b!68195 m!108831))

(declare-fun m!108833 () Bool)

(assert (=> b!68195 m!108833))

(declare-fun m!108835 () Bool)

(assert (=> b!68195 m!108835))

(declare-fun m!108837 () Bool)

(assert (=> b!68195 m!108837))

(declare-fun m!108839 () Bool)

(assert (=> b!68195 m!108839))

(declare-fun m!108841 () Bool)

(assert (=> b!68195 m!108841))

(assert (=> b!68195 m!108837))

(assert (=> b!68195 m!108829))

(declare-fun m!108843 () Bool)

(assert (=> b!68195 m!108843))

(declare-fun m!108845 () Bool)

(assert (=> b!68195 m!108845))

(declare-fun m!108847 () Bool)

(assert (=> b!68195 m!108847))

(declare-fun m!108849 () Bool)

(assert (=> b!68195 m!108849))

(declare-fun m!108851 () Bool)

(assert (=> b!68195 m!108851))

(declare-fun m!108853 () Bool)

(assert (=> b!68195 m!108853))

(assert (=> b!68195 m!108497))

(declare-fun m!108855 () Bool)

(assert (=> b!68195 m!108855))

(declare-fun m!108857 () Bool)

(assert (=> b!68195 m!108857))

(declare-fun m!108859 () Bool)

(assert (=> b!68195 m!108859))

(declare-fun m!108861 () Bool)

(assert (=> b!68195 m!108861))

(declare-fun m!108863 () Bool)

(assert (=> b!68195 m!108863))

(assert (=> b!68195 m!108847))

(declare-fun m!108865 () Bool)

(assert (=> b!68195 m!108865))

(declare-fun m!108867 () Bool)

(assert (=> b!68195 m!108867))

(declare-fun m!108869 () Bool)

(assert (=> b!68195 m!108869))

(assert (=> b!68195 m!108861))

(declare-fun m!108871 () Bool)

(assert (=> b!68195 m!108871))

(declare-fun m!108873 () Bool)

(assert (=> b!68195 m!108873))

(declare-fun m!108875 () Bool)

(assert (=> b!68195 m!108875))

(declare-fun m!108877 () Bool)

(assert (=> b!68195 m!108877))

(declare-fun m!108879 () Bool)

(assert (=> b!68195 m!108879))

(declare-fun m!108881 () Bool)

(assert (=> b!68195 m!108881))

(declare-fun m!108883 () Bool)

(assert (=> b!68195 m!108883))

(declare-fun m!108885 () Bool)

(assert (=> b!68195 m!108885))

(declare-fun m!108887 () Bool)

(assert (=> b!68188 m!108887))

(declare-fun m!108889 () Bool)

(assert (=> b!68188 m!108889))

(declare-fun m!108891 () Bool)

(assert (=> b!68194 m!108891))

(declare-fun m!108893 () Bool)

(assert (=> b!68192 m!108893))

(declare-fun m!108895 () Bool)

(assert (=> b!68192 m!108895))

(declare-fun m!108897 () Bool)

(assert (=> b!68192 m!108897))

(declare-fun m!108899 () Bool)

(assert (=> b!68192 m!108899))

(declare-fun m!108901 () Bool)

(assert (=> b!68192 m!108901))

(assert (=> b!68036 d!21598))

(declare-fun d!21660 () Bool)

(assert (=> d!21660 (isPrefixOf!0 thiss!1379 (_2!3097 lt!108665))))

(declare-fun lt!109147 () Unit!4575)

(declare-fun choose!30 (BitStream!2282 BitStream!2282 BitStream!2282) Unit!4575)

(assert (=> d!21660 (= lt!109147 (choose!30 thiss!1379 (_2!3097 lt!108678) (_2!3097 lt!108665)))))

(assert (=> d!21660 (isPrefixOf!0 thiss!1379 (_2!3097 lt!108678))))

(assert (=> d!21660 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3097 lt!108678) (_2!3097 lt!108665)) lt!109147)))

(declare-fun bs!5234 () Bool)

(assert (= bs!5234 d!21660))

(assert (=> bs!5234 m!108523))

(declare-fun m!108903 () Bool)

(assert (=> bs!5234 m!108903))

(assert (=> bs!5234 m!108491))

(assert (=> b!68036 d!21660))

(declare-fun lt!109203 () tuple2!5974)

(declare-fun b!68207 () Bool)

(declare-fun lt!109188 () (_ BitVec 64))

(declare-fun lt!109195 () (_ BitVec 64))

(declare-fun e!44617 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2282 (_ BitVec 64)) BitStream!2282)

(assert (=> b!68207 (= e!44617 (= (_1!3098 lt!109203) (withMovedBitIndex!0 (_2!3098 lt!109203) (bvsub lt!109195 lt!109188))))))

(assert (=> b!68207 (or (= (bvand lt!109195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109188 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109195 lt!109188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68207 (= lt!109188 (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108678))) (currentByte!3404 (_2!3097 lt!108678)) (currentBit!3399 (_2!3097 lt!108678))))))

(assert (=> b!68207 (= lt!109195 (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379)))))

(declare-fun b!68208 () Bool)

(declare-fun res!56415 () Bool)

(assert (=> b!68208 (=> (not res!56415) (not e!44617))))

(assert (=> b!68208 (= res!56415 (isPrefixOf!0 (_2!3098 lt!109203) (_2!3097 lt!108678)))))

(declare-fun b!68209 () Bool)

(declare-fun res!56417 () Bool)

(assert (=> b!68209 (=> (not res!56417) (not e!44617))))

(assert (=> b!68209 (= res!56417 (isPrefixOf!0 (_1!3098 lt!109203) thiss!1379))))

(declare-fun d!21662 () Bool)

(assert (=> d!21662 e!44617))

(declare-fun res!56416 () Bool)

(assert (=> d!21662 (=> (not res!56416) (not e!44617))))

(assert (=> d!21662 (= res!56416 (isPrefixOf!0 (_1!3098 lt!109203) (_2!3098 lt!109203)))))

(declare-fun lt!109191 () BitStream!2282)

(assert (=> d!21662 (= lt!109203 (tuple2!5975 lt!109191 (_2!3097 lt!108678)))))

(declare-fun lt!109200 () Unit!4575)

(declare-fun lt!109198 () Unit!4575)

(assert (=> d!21662 (= lt!109200 lt!109198)))

(assert (=> d!21662 (isPrefixOf!0 lt!109191 (_2!3097 lt!108678))))

(assert (=> d!21662 (= lt!109198 (lemmaIsPrefixTransitive!0 lt!109191 (_2!3097 lt!108678) (_2!3097 lt!108678)))))

(declare-fun lt!109202 () Unit!4575)

(declare-fun lt!109201 () Unit!4575)

(assert (=> d!21662 (= lt!109202 lt!109201)))

(assert (=> d!21662 (isPrefixOf!0 lt!109191 (_2!3097 lt!108678))))

(assert (=> d!21662 (= lt!109201 (lemmaIsPrefixTransitive!0 lt!109191 thiss!1379 (_2!3097 lt!108678)))))

(declare-fun lt!109196 () Unit!4575)

(declare-fun e!44616 () Unit!4575)

(assert (=> d!21662 (= lt!109196 e!44616)))

(declare-fun c!5016 () Bool)

(assert (=> d!21662 (= c!5016 (not (= (size!1333 (buf!1714 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!109192 () Unit!4575)

(declare-fun lt!109189 () Unit!4575)

(assert (=> d!21662 (= lt!109192 lt!109189)))

(assert (=> d!21662 (isPrefixOf!0 (_2!3097 lt!108678) (_2!3097 lt!108678))))

(assert (=> d!21662 (= lt!109189 (lemmaIsPrefixRefl!0 (_2!3097 lt!108678)))))

(declare-fun lt!109205 () Unit!4575)

(declare-fun lt!109197 () Unit!4575)

(assert (=> d!21662 (= lt!109205 lt!109197)))

(assert (=> d!21662 (= lt!109197 (lemmaIsPrefixRefl!0 (_2!3097 lt!108678)))))

(declare-fun lt!109194 () Unit!4575)

(declare-fun lt!109199 () Unit!4575)

(assert (=> d!21662 (= lt!109194 lt!109199)))

(assert (=> d!21662 (isPrefixOf!0 lt!109191 lt!109191)))

(assert (=> d!21662 (= lt!109199 (lemmaIsPrefixRefl!0 lt!109191))))

(declare-fun lt!109207 () Unit!4575)

(declare-fun lt!109190 () Unit!4575)

(assert (=> d!21662 (= lt!109207 lt!109190)))

(assert (=> d!21662 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21662 (= lt!109190 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21662 (= lt!109191 (BitStream!2283 (buf!1714 (_2!3097 lt!108678)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379)))))

(assert (=> d!21662 (isPrefixOf!0 thiss!1379 (_2!3097 lt!108678))))

(assert (=> d!21662 (= (reader!0 thiss!1379 (_2!3097 lt!108678)) lt!109203)))

(declare-fun b!68210 () Bool)

(declare-fun lt!109204 () Unit!4575)

(assert (=> b!68210 (= e!44616 lt!109204)))

(declare-fun lt!109206 () (_ BitVec 64))

(assert (=> b!68210 (= lt!109206 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109193 () (_ BitVec 64))

(assert (=> b!68210 (= lt!109193 (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2879 array!2879 (_ BitVec 64) (_ BitVec 64)) Unit!4575)

(assert (=> b!68210 (= lt!109204 (arrayBitRangesEqSymmetric!0 (buf!1714 thiss!1379) (buf!1714 (_2!3097 lt!108678)) lt!109206 lt!109193))))

(assert (=> b!68210 (arrayBitRangesEq!0 (buf!1714 (_2!3097 lt!108678)) (buf!1714 thiss!1379) lt!109206 lt!109193)))

(declare-fun b!68211 () Bool)

(declare-fun Unit!4594 () Unit!4575)

(assert (=> b!68211 (= e!44616 Unit!4594)))

(assert (= (and d!21662 c!5016) b!68210))

(assert (= (and d!21662 (not c!5016)) b!68211))

(assert (= (and d!21662 res!56416) b!68209))

(assert (= (and b!68209 res!56417) b!68208))

(assert (= (and b!68208 res!56415) b!68207))

(declare-fun m!108905 () Bool)

(assert (=> b!68208 m!108905))

(assert (=> b!68210 m!108569))

(declare-fun m!108907 () Bool)

(assert (=> b!68210 m!108907))

(declare-fun m!108909 () Bool)

(assert (=> b!68210 m!108909))

(declare-fun m!108911 () Bool)

(assert (=> b!68207 m!108911))

(assert (=> b!68207 m!108497))

(assert (=> b!68207 m!108569))

(declare-fun m!108913 () Bool)

(assert (=> b!68209 m!108913))

(assert (=> d!21662 m!108567))

(declare-fun m!108915 () Bool)

(assert (=> d!21662 m!108915))

(assert (=> d!21662 m!108565))

(declare-fun m!108917 () Bool)

(assert (=> d!21662 m!108917))

(declare-fun m!108919 () Bool)

(assert (=> d!21662 m!108919))

(assert (=> d!21662 m!108819))

(declare-fun m!108921 () Bool)

(assert (=> d!21662 m!108921))

(declare-fun m!108923 () Bool)

(assert (=> d!21662 m!108923))

(declare-fun m!108925 () Bool)

(assert (=> d!21662 m!108925))

(assert (=> d!21662 m!108491))

(assert (=> d!21662 m!108821))

(assert (=> b!68036 d!21662))

(declare-fun d!21664 () Bool)

(declare-fun res!56420 () Bool)

(declare-fun e!44618 () Bool)

(assert (=> d!21664 (=> (not res!56420) (not e!44618))))

(assert (=> d!21664 (= res!56420 (= (size!1333 (buf!1714 (_2!3097 lt!108678))) (size!1333 (buf!1714 (_2!3097 lt!108665)))))))

(assert (=> d!21664 (= (isPrefixOf!0 (_2!3097 lt!108678) (_2!3097 lt!108665)) e!44618)))

(declare-fun b!68212 () Bool)

(declare-fun res!56419 () Bool)

(assert (=> b!68212 (=> (not res!56419) (not e!44618))))

(assert (=> b!68212 (= res!56419 (bvsle (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108678))) (currentByte!3404 (_2!3097 lt!108678)) (currentBit!3399 (_2!3097 lt!108678))) (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108665))) (currentByte!3404 (_2!3097 lt!108665)) (currentBit!3399 (_2!3097 lt!108665)))))))

(declare-fun b!68213 () Bool)

(declare-fun e!44619 () Bool)

(assert (=> b!68213 (= e!44618 e!44619)))

(declare-fun res!56418 () Bool)

(assert (=> b!68213 (=> res!56418 e!44619)))

(assert (=> b!68213 (= res!56418 (= (size!1333 (buf!1714 (_2!3097 lt!108678))) #b00000000000000000000000000000000))))

(declare-fun b!68214 () Bool)

(assert (=> b!68214 (= e!44619 (arrayBitRangesEq!0 (buf!1714 (_2!3097 lt!108678)) (buf!1714 (_2!3097 lt!108665)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108678))) (currentByte!3404 (_2!3097 lt!108678)) (currentBit!3399 (_2!3097 lt!108678)))))))

(assert (= (and d!21664 res!56420) b!68212))

(assert (= (and b!68212 res!56419) b!68213))

(assert (= (and b!68213 (not res!56418)) b!68214))

(assert (=> b!68212 m!108497))

(assert (=> b!68212 m!108535))

(assert (=> b!68214 m!108497))

(assert (=> b!68214 m!108497))

(declare-fun m!108927 () Bool)

(assert (=> b!68214 m!108927))

(assert (=> b!68036 d!21664))

(declare-fun d!21666 () Bool)

(assert (=> d!21666 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108678)))) ((_ sign_extend 32) (currentByte!3404 thiss!1379)) ((_ sign_extend 32) (currentBit!3399 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!109210 () Unit!4575)

(declare-fun choose!9 (BitStream!2282 array!2879 (_ BitVec 64) BitStream!2282) Unit!4575)

(assert (=> d!21666 (= lt!109210 (choose!9 thiss!1379 (buf!1714 (_2!3097 lt!108678)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2283 (buf!1714 (_2!3097 lt!108678)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379))))))

(assert (=> d!21666 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1714 (_2!3097 lt!108678)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!109210)))

(declare-fun bs!5235 () Bool)

(assert (= bs!5235 d!21666))

(assert (=> bs!5235 m!108527))

(declare-fun m!108929 () Bool)

(assert (=> bs!5235 m!108929))

(assert (=> b!68036 d!21666))

(declare-fun d!21668 () Bool)

(assert (=> d!21668 (= (bitAt!0 (buf!1714 (_1!3098 lt!108681)) lt!108673) (not (= (bvand ((_ sign_extend 24) (select (arr!1906 (buf!1714 (_1!3098 lt!108681))) ((_ extract 31 0) (bvsdiv lt!108673 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!108673 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5236 () Bool)

(assert (= bs!5236 d!21668))

(declare-fun m!108931 () Bool)

(assert (=> bs!5236 m!108931))

(assert (=> bs!5236 m!108609))

(assert (=> b!68046 d!21668))

(declare-fun d!21670 () Bool)

(assert (=> d!21670 (= (bitAt!0 (buf!1714 (_1!3098 lt!108674)) lt!108673) (not (= (bvand ((_ sign_extend 24) (select (arr!1906 (buf!1714 (_1!3098 lt!108674))) ((_ extract 31 0) (bvsdiv lt!108673 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!108673 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5237 () Bool)

(assert (= bs!5237 d!21670))

(declare-fun m!108933 () Bool)

(assert (=> bs!5237 m!108933))

(assert (=> bs!5237 m!108609))

(assert (=> b!68046 d!21670))

(declare-fun d!21672 () Bool)

(declare-fun size!1335 (List!716) Int)

(assert (=> d!21672 (= (length!344 lt!108662) (size!1335 lt!108662))))

(declare-fun bs!5238 () Bool)

(assert (= bs!5238 d!21672))

(declare-fun m!108935 () Bool)

(assert (=> bs!5238 m!108935))

(assert (=> b!68037 d!21672))

(declare-fun d!21674 () Bool)

(declare-fun res!56423 () Bool)

(declare-fun e!44620 () Bool)

(assert (=> d!21674 (=> (not res!56423) (not e!44620))))

(assert (=> d!21674 (= res!56423 (= (size!1333 (buf!1714 thiss!1379)) (size!1333 (buf!1714 (_2!3097 lt!108678)))))))

(assert (=> d!21674 (= (isPrefixOf!0 thiss!1379 (_2!3097 lt!108678)) e!44620)))

(declare-fun b!68215 () Bool)

(declare-fun res!56422 () Bool)

(assert (=> b!68215 (=> (not res!56422) (not e!44620))))

(assert (=> b!68215 (= res!56422 (bvsle (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379)) (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108678))) (currentByte!3404 (_2!3097 lt!108678)) (currentBit!3399 (_2!3097 lt!108678)))))))

(declare-fun b!68216 () Bool)

(declare-fun e!44621 () Bool)

(assert (=> b!68216 (= e!44620 e!44621)))

(declare-fun res!56421 () Bool)

(assert (=> b!68216 (=> res!56421 e!44621)))

(assert (=> b!68216 (= res!56421 (= (size!1333 (buf!1714 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!68217 () Bool)

(assert (=> b!68217 (= e!44621 (arrayBitRangesEq!0 (buf!1714 thiss!1379) (buf!1714 (_2!3097 lt!108678)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379))))))

(assert (= (and d!21674 res!56423) b!68215))

(assert (= (and b!68215 res!56422) b!68216))

(assert (= (and b!68216 (not res!56421)) b!68217))

(assert (=> b!68215 m!108569))

(assert (=> b!68215 m!108497))

(assert (=> b!68217 m!108569))

(assert (=> b!68217 m!108569))

(declare-fun m!108937 () Bool)

(assert (=> b!68217 m!108937))

(assert (=> b!68039 d!21674))

(declare-fun d!21676 () Bool)

(assert (=> d!21676 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108678)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678))) lt!108667) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108678)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678)))) lt!108667))))

(declare-fun bs!5239 () Bool)

(assert (= bs!5239 d!21676))

(declare-fun m!108939 () Bool)

(assert (=> bs!5239 m!108939))

(assert (=> b!68039 d!21676))

(declare-fun d!21678 () Bool)

(declare-fun e!44624 () Bool)

(assert (=> d!21678 e!44624))

(declare-fun res!56426 () Bool)

(assert (=> d!21678 (=> (not res!56426) (not e!44624))))

(assert (=> d!21678 (= res!56426 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!109213 () Unit!4575)

(declare-fun choose!27 (BitStream!2282 BitStream!2282 (_ BitVec 64) (_ BitVec 64)) Unit!4575)

(assert (=> d!21678 (= lt!109213 (choose!27 thiss!1379 (_2!3097 lt!108678) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!21678 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!21678 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3097 lt!108678) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!109213)))

(declare-fun b!68220 () Bool)

(assert (=> b!68220 (= e!44624 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108678)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!21678 res!56426) b!68220))

(declare-fun m!108941 () Bool)

(assert (=> d!21678 m!108941))

(declare-fun m!108943 () Bool)

(assert (=> b!68220 m!108943))

(assert (=> b!68039 d!21678))

(declare-fun b!68317 () Bool)

(declare-fun res!56496 () Bool)

(declare-fun e!44673 () Bool)

(assert (=> b!68317 (=> (not res!56496) (not e!44673))))

(declare-fun lt!109371 () tuple2!5972)

(assert (=> b!68317 (= res!56496 (= (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!109371))) (currentByte!3404 (_2!3097 lt!109371)) (currentBit!3399 (_2!3097 lt!109371))) (bvadd (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!68318 () Bool)

(declare-fun res!56491 () Bool)

(declare-fun e!44676 () Bool)

(assert (=> b!68318 (=> (not res!56491) (not e!44676))))

(declare-fun lt!109377 () tuple2!5972)

(assert (=> b!68318 (= res!56491 (isPrefixOf!0 thiss!1379 (_2!3097 lt!109377)))))

(declare-fun b!68319 () Bool)

(declare-fun res!56490 () Bool)

(assert (=> b!68319 (=> (not res!56490) (not e!44673))))

(assert (=> b!68319 (= res!56490 (isPrefixOf!0 thiss!1379 (_2!3097 lt!109371)))))

(declare-fun b!68320 () Bool)

(declare-fun e!44674 () Bool)

(assert (=> b!68320 (= e!44676 e!44674)))

(declare-fun res!56489 () Bool)

(assert (=> b!68320 (=> (not res!56489) (not e!44674))))

(declare-fun lt!109370 () (_ BitVec 8))

(declare-datatypes ((tuple2!5986 0))(
  ( (tuple2!5987 (_1!3104 BitStream!2282) (_2!3104 Bool)) )
))
(declare-fun lt!109378 () tuple2!5986)

(assert (=> b!68320 (= res!56489 (and (= (_2!3104 lt!109378) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1906 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!109370)) #b00000000000000000000000000000000))) (= (_1!3104 lt!109378) (_2!3097 lt!109377))))))

(declare-fun lt!109375 () tuple2!5980)

(declare-fun lt!109374 () BitStream!2282)

(assert (=> b!68320 (= lt!109375 (readBits!0 lt!109374 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2282) tuple2!5986)

(assert (=> b!68320 (= lt!109378 (readBitPure!0 lt!109374))))

(declare-fun readerFrom!0 (BitStream!2282 (_ BitVec 32) (_ BitVec 32)) BitStream!2282)

(assert (=> b!68320 (= lt!109374 (readerFrom!0 (_2!3097 lt!109377) (currentBit!3399 thiss!1379) (currentByte!3404 thiss!1379)))))

(declare-fun d!21680 () Bool)

(assert (=> d!21680 e!44676))

(declare-fun res!56492 () Bool)

(assert (=> d!21680 (=> (not res!56492) (not e!44676))))

(assert (=> d!21680 (= res!56492 (= (size!1333 (buf!1714 (_2!3097 lt!109377))) (size!1333 (buf!1714 thiss!1379))))))

(declare-fun lt!109381 () array!2879)

(assert (=> d!21680 (= lt!109370 (select (arr!1906 lt!109381) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!21680 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1333 lt!109381)))))

(assert (=> d!21680 (= lt!109381 (array!2880 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!109379 () tuple2!5972)

(assert (=> d!21680 (= lt!109377 (tuple2!5973 (_1!3097 lt!109379) (_2!3097 lt!109379)))))

(assert (=> d!21680 (= lt!109379 lt!109371)))

(assert (=> d!21680 e!44673))

(declare-fun res!56493 () Bool)

(assert (=> d!21680 (=> (not res!56493) (not e!44673))))

(assert (=> d!21680 (= res!56493 (= (size!1333 (buf!1714 thiss!1379)) (size!1333 (buf!1714 (_2!3097 lt!109371)))))))

(declare-fun lt!109380 () Bool)

(declare-fun appendBit!0 (BitStream!2282 Bool) tuple2!5972)

(assert (=> d!21680 (= lt!109371 (appendBit!0 thiss!1379 lt!109380))))

(assert (=> d!21680 (= lt!109380 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1906 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!21680 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!21680 (= (appendBitFromByte!0 thiss!1379 (select (arr!1906 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!109377)))

(declare-fun b!68321 () Bool)

(declare-fun res!56495 () Bool)

(assert (=> b!68321 (=> (not res!56495) (not e!44676))))

(declare-fun lt!109376 () (_ BitVec 64))

(declare-fun lt!109373 () (_ BitVec 64))

(assert (=> b!68321 (= res!56495 (= (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!109377))) (currentByte!3404 (_2!3097 lt!109377)) (currentBit!3399 (_2!3097 lt!109377))) (bvadd lt!109376 lt!109373)))))

(assert (=> b!68321 (or (not (= (bvand lt!109376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109373 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!109376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!109376 lt!109373) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68321 (= lt!109373 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!68321 (= lt!109376 (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379)))))

(declare-fun b!68322 () Bool)

(declare-fun e!44675 () Bool)

(assert (=> b!68322 (= e!44673 e!44675)))

(declare-fun res!56494 () Bool)

(assert (=> b!68322 (=> (not res!56494) (not e!44675))))

(declare-fun lt!109372 () tuple2!5986)

(assert (=> b!68322 (= res!56494 (and (= (_2!3104 lt!109372) lt!109380) (= (_1!3104 lt!109372) (_2!3097 lt!109371))))))

(assert (=> b!68322 (= lt!109372 (readBitPure!0 (readerFrom!0 (_2!3097 lt!109371) (currentBit!3399 thiss!1379) (currentByte!3404 thiss!1379))))))

(declare-fun b!68323 () Bool)

(assert (=> b!68323 (= e!44675 (= (bitIndex!0 (size!1333 (buf!1714 (_1!3104 lt!109372))) (currentByte!3404 (_1!3104 lt!109372)) (currentBit!3399 (_1!3104 lt!109372))) (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!109371))) (currentByte!3404 (_2!3097 lt!109371)) (currentBit!3399 (_2!3097 lt!109371)))))))

(declare-fun b!68324 () Bool)

(assert (=> b!68324 (= e!44674 (= (bitIndex!0 (size!1333 (buf!1714 (_1!3104 lt!109378))) (currentByte!3404 (_1!3104 lt!109378)) (currentBit!3399 (_1!3104 lt!109378))) (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!109377))) (currentByte!3404 (_2!3097 lt!109377)) (currentBit!3399 (_2!3097 lt!109377)))))))

(assert (= (and d!21680 res!56493) b!68317))

(assert (= (and b!68317 res!56496) b!68319))

(assert (= (and b!68319 res!56490) b!68322))

(assert (= (and b!68322 res!56494) b!68323))

(assert (= (and d!21680 res!56492) b!68321))

(assert (= (and b!68321 res!56495) b!68318))

(assert (= (and b!68318 res!56491) b!68320))

(assert (= (and b!68320 res!56489) b!68324))

(declare-fun m!109079 () Bool)

(assert (=> b!68319 m!109079))

(declare-fun m!109081 () Bool)

(assert (=> d!21680 m!109081))

(declare-fun m!109083 () Bool)

(assert (=> d!21680 m!109083))

(declare-fun m!109085 () Bool)

(assert (=> d!21680 m!109085))

(declare-fun m!109087 () Bool)

(assert (=> b!68321 m!109087))

(assert (=> b!68321 m!108569))

(declare-fun m!109089 () Bool)

(assert (=> b!68317 m!109089))

(assert (=> b!68317 m!108569))

(declare-fun m!109091 () Bool)

(assert (=> b!68323 m!109091))

(assert (=> b!68323 m!109089))

(declare-fun m!109093 () Bool)

(assert (=> b!68320 m!109093))

(declare-fun m!109095 () Bool)

(assert (=> b!68320 m!109095))

(declare-fun m!109097 () Bool)

(assert (=> b!68320 m!109097))

(declare-fun m!109099 () Bool)

(assert (=> b!68322 m!109099))

(assert (=> b!68322 m!109099))

(declare-fun m!109101 () Bool)

(assert (=> b!68322 m!109101))

(declare-fun m!109103 () Bool)

(assert (=> b!68318 m!109103))

(declare-fun m!109105 () Bool)

(assert (=> b!68324 m!109105))

(assert (=> b!68324 m!109087))

(assert (=> b!68039 d!21680))

(declare-fun d!21740 () Bool)

(assert (=> d!21740 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 thiss!1379))) ((_ sign_extend 32) (currentByte!3404 thiss!1379)) ((_ sign_extend 32) (currentBit!3399 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1333 (buf!1714 thiss!1379))) ((_ sign_extend 32) (currentByte!3404 thiss!1379)) ((_ sign_extend 32) (currentBit!3399 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5252 () Bool)

(assert (= bs!5252 d!21740))

(declare-fun m!109107 () Bool)

(assert (=> bs!5252 m!109107))

(assert (=> b!68028 d!21740))

(declare-fun d!21742 () Bool)

(assert (=> d!21742 (= (invariant!0 (currentBit!3399 (_2!3097 lt!108665)) (currentByte!3404 (_2!3097 lt!108665)) (size!1333 (buf!1714 (_2!3097 lt!108665)))) (and (bvsge (currentBit!3399 (_2!3097 lt!108665)) #b00000000000000000000000000000000) (bvslt (currentBit!3399 (_2!3097 lt!108665)) #b00000000000000000000000000001000) (bvsge (currentByte!3404 (_2!3097 lt!108665)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3404 (_2!3097 lt!108665)) (size!1333 (buf!1714 (_2!3097 lt!108665)))) (and (= (currentBit!3399 (_2!3097 lt!108665)) #b00000000000000000000000000000000) (= (currentByte!3404 (_2!3097 lt!108665)) (size!1333 (buf!1714 (_2!3097 lt!108665))))))))))

(assert (=> b!68038 d!21742))

(declare-fun d!21744 () Bool)

(assert (=> d!21744 (= (array_inv!1200 srcBuffer!2) (bvsge (size!1333 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13264 d!21744))

(declare-fun d!21746 () Bool)

(assert (=> d!21746 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3399 thiss!1379) (currentByte!3404 thiss!1379) (size!1333 (buf!1714 thiss!1379))))))

(declare-fun bs!5253 () Bool)

(assert (= bs!5253 d!21746))

(declare-fun m!109109 () Bool)

(assert (=> bs!5253 m!109109))

(assert (=> start!13264 d!21746))

(declare-fun d!21748 () Bool)

(assert (=> d!21748 (= (invariant!0 (currentBit!3399 (_2!3097 lt!108678)) (currentByte!3404 (_2!3097 lt!108678)) (size!1333 (buf!1714 (_2!3097 lt!108678)))) (and (bvsge (currentBit!3399 (_2!3097 lt!108678)) #b00000000000000000000000000000000) (bvslt (currentBit!3399 (_2!3097 lt!108678)) #b00000000000000000000000000001000) (bvsge (currentByte!3404 (_2!3097 lt!108678)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3404 (_2!3097 lt!108678)) (size!1333 (buf!1714 (_2!3097 lt!108678)))) (and (= (currentBit!3399 (_2!3097 lt!108678)) #b00000000000000000000000000000000) (= (currentByte!3404 (_2!3097 lt!108678)) (size!1333 (buf!1714 (_2!3097 lt!108678))))))))))

(assert (=> b!68029 d!21748))

(declare-fun d!21750 () Bool)

(declare-fun res!56499 () Bool)

(declare-fun e!44677 () Bool)

(assert (=> d!21750 (=> (not res!56499) (not e!44677))))

(assert (=> d!21750 (= res!56499 (= (size!1333 (buf!1714 thiss!1379)) (size!1333 (buf!1714 thiss!1379))))))

(assert (=> d!21750 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!44677)))

(declare-fun b!68325 () Bool)

(declare-fun res!56498 () Bool)

(assert (=> b!68325 (=> (not res!56498) (not e!44677))))

(assert (=> b!68325 (= res!56498 (bvsle (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379)) (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379))))))

(declare-fun b!68326 () Bool)

(declare-fun e!44678 () Bool)

(assert (=> b!68326 (= e!44677 e!44678)))

(declare-fun res!56497 () Bool)

(assert (=> b!68326 (=> res!56497 e!44678)))

(assert (=> b!68326 (= res!56497 (= (size!1333 (buf!1714 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!68327 () Bool)

(assert (=> b!68327 (= e!44678 (arrayBitRangesEq!0 (buf!1714 thiss!1379) (buf!1714 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379))))))

(assert (= (and d!21750 res!56499) b!68325))

(assert (= (and b!68325 res!56498) b!68326))

(assert (= (and b!68326 (not res!56497)) b!68327))

(assert (=> b!68325 m!108569))

(assert (=> b!68325 m!108569))

(assert (=> b!68327 m!108569))

(assert (=> b!68327 m!108569))

(declare-fun m!109111 () Bool)

(assert (=> b!68327 m!109111))

(assert (=> b!68031 d!21750))

(declare-fun d!21752 () Bool)

(assert (=> d!21752 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!109384 () Unit!4575)

(declare-fun choose!11 (BitStream!2282) Unit!4575)

(assert (=> d!21752 (= lt!109384 (choose!11 thiss!1379))))

(assert (=> d!21752 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!109384)))

(declare-fun bs!5255 () Bool)

(assert (= bs!5255 d!21752))

(assert (=> bs!5255 m!108565))

(declare-fun m!109113 () Bool)

(assert (=> bs!5255 m!109113))

(assert (=> b!68031 d!21752))

(declare-fun d!21754 () Bool)

(declare-fun e!44681 () Bool)

(assert (=> d!21754 e!44681))

(declare-fun res!56505 () Bool)

(assert (=> d!21754 (=> (not res!56505) (not e!44681))))

(declare-fun lt!109400 () (_ BitVec 64))

(declare-fun lt!109402 () (_ BitVec 64))

(declare-fun lt!109401 () (_ BitVec 64))

(assert (=> d!21754 (= res!56505 (= lt!109400 (bvsub lt!109401 lt!109402)))))

(assert (=> d!21754 (or (= (bvand lt!109401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109402 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109401 lt!109402) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21754 (= lt!109402 (remainingBits!0 ((_ sign_extend 32) (size!1333 (buf!1714 thiss!1379))) ((_ sign_extend 32) (currentByte!3404 thiss!1379)) ((_ sign_extend 32) (currentBit!3399 thiss!1379))))))

(declare-fun lt!109398 () (_ BitVec 64))

(declare-fun lt!109399 () (_ BitVec 64))

(assert (=> d!21754 (= lt!109401 (bvmul lt!109398 lt!109399))))

(assert (=> d!21754 (or (= lt!109398 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!109399 (bvsdiv (bvmul lt!109398 lt!109399) lt!109398)))))

(assert (=> d!21754 (= lt!109399 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21754 (= lt!109398 ((_ sign_extend 32) (size!1333 (buf!1714 thiss!1379))))))

(assert (=> d!21754 (= lt!109400 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3404 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3399 thiss!1379))))))

(assert (=> d!21754 (invariant!0 (currentBit!3399 thiss!1379) (currentByte!3404 thiss!1379) (size!1333 (buf!1714 thiss!1379)))))

(assert (=> d!21754 (= (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379)) lt!109400)))

(declare-fun b!68332 () Bool)

(declare-fun res!56504 () Bool)

(assert (=> b!68332 (=> (not res!56504) (not e!44681))))

(assert (=> b!68332 (= res!56504 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!109400))))

(declare-fun b!68333 () Bool)

(declare-fun lt!109397 () (_ BitVec 64))

(assert (=> b!68333 (= e!44681 (bvsle lt!109400 (bvmul lt!109397 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68333 (or (= lt!109397 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!109397 #b0000000000000000000000000000000000000000000000000000000000001000) lt!109397)))))

(assert (=> b!68333 (= lt!109397 ((_ sign_extend 32) (size!1333 (buf!1714 thiss!1379))))))

(assert (= (and d!21754 res!56505) b!68332))

(assert (= (and b!68332 res!56504) b!68333))

(assert (=> d!21754 m!109107))

(assert (=> d!21754 m!109109))

(assert (=> b!68031 d!21754))

(declare-fun d!21756 () Bool)

(declare-fun e!44682 () Bool)

(assert (=> d!21756 e!44682))

(declare-fun res!56507 () Bool)

(assert (=> d!21756 (=> (not res!56507) (not e!44682))))

(declare-fun lt!109406 () (_ BitVec 64))

(declare-fun lt!109407 () (_ BitVec 64))

(declare-fun lt!109408 () (_ BitVec 64))

(assert (=> d!21756 (= res!56507 (= lt!109406 (bvsub lt!109407 lt!109408)))))

(assert (=> d!21756 (or (= (bvand lt!109407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109408 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109407 lt!109408) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21756 (= lt!109408 (remainingBits!0 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108665)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108665))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108665)))))))

(declare-fun lt!109404 () (_ BitVec 64))

(declare-fun lt!109405 () (_ BitVec 64))

(assert (=> d!21756 (= lt!109407 (bvmul lt!109404 lt!109405))))

(assert (=> d!21756 (or (= lt!109404 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!109405 (bvsdiv (bvmul lt!109404 lt!109405) lt!109404)))))

(assert (=> d!21756 (= lt!109405 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21756 (= lt!109404 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108665)))))))

(assert (=> d!21756 (= lt!109406 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108665))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108665)))))))

(assert (=> d!21756 (invariant!0 (currentBit!3399 (_2!3097 lt!108665)) (currentByte!3404 (_2!3097 lt!108665)) (size!1333 (buf!1714 (_2!3097 lt!108665))))))

(assert (=> d!21756 (= (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108665))) (currentByte!3404 (_2!3097 lt!108665)) (currentBit!3399 (_2!3097 lt!108665))) lt!109406)))

(declare-fun b!68334 () Bool)

(declare-fun res!56506 () Bool)

(assert (=> b!68334 (=> (not res!56506) (not e!44682))))

(assert (=> b!68334 (= res!56506 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!109406))))

(declare-fun b!68335 () Bool)

(declare-fun lt!109403 () (_ BitVec 64))

(assert (=> b!68335 (= e!44682 (bvsle lt!109406 (bvmul lt!109403 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68335 (or (= lt!109403 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!109403 #b0000000000000000000000000000000000000000000000000000000000001000) lt!109403)))))

(assert (=> b!68335 (= lt!109403 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108665)))))))

(assert (= (and d!21756 res!56507) b!68334))

(assert (= (and b!68334 res!56506) b!68335))

(declare-fun m!109115 () Bool)

(assert (=> d!21756 m!109115))

(assert (=> d!21756 m!108479))

(assert (=> b!68041 d!21756))

(declare-fun d!21758 () Bool)

(assert (=> d!21758 (= (head!535 (byteArrayBitContentToList!0 (_2!3097 lt!108678) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!831 (byteArrayBitContentToList!0 (_2!3097 lt!108678) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!68030 d!21758))

(declare-fun d!21760 () Bool)

(declare-fun c!5035 () Bool)

(assert (=> d!21760 (= c!5035 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44685 () List!716)

(assert (=> d!21760 (= (byteArrayBitContentToList!0 (_2!3097 lt!108678) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!44685)))

(declare-fun b!68340 () Bool)

(assert (=> b!68340 (= e!44685 Nil!713)))

(declare-fun b!68341 () Bool)

(assert (=> b!68341 (= e!44685 (Cons!712 (not (= (bvand ((_ sign_extend 24) (select (arr!1906 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3097 lt!108678) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21760 c!5035) b!68340))

(assert (= (and d!21760 (not c!5035)) b!68341))

(assert (=> b!68341 m!108489))

(assert (=> b!68341 m!109085))

(declare-fun m!109117 () Bool)

(assert (=> b!68341 m!109117))

(assert (=> b!68030 d!21760))

(declare-fun d!21762 () Bool)

(assert (=> d!21762 (= (head!535 (bitStreamReadBitsIntoList!0 (_2!3097 lt!108678) (_1!3098 lt!108679) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!831 (bitStreamReadBitsIntoList!0 (_2!3097 lt!108678) (_1!3098 lt!108679) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!68030 d!21762))

(declare-fun b!68352 () Bool)

(declare-fun e!44691 () Bool)

(declare-fun lt!109415 () List!716)

(declare-fun isEmpty!217 (List!716) Bool)

(assert (=> b!68352 (= e!44691 (isEmpty!217 lt!109415))))

(declare-fun b!68353 () Bool)

(assert (=> b!68353 (= e!44691 (> (length!344 lt!109415) 0))))

(declare-fun b!68350 () Bool)

(declare-datatypes ((tuple2!5988 0))(
  ( (tuple2!5989 (_1!3105 List!716) (_2!3105 BitStream!2282)) )
))
(declare-fun e!44690 () tuple2!5988)

(assert (=> b!68350 (= e!44690 (tuple2!5989 Nil!713 (_1!3098 lt!108679)))))

(declare-fun d!21764 () Bool)

(assert (=> d!21764 e!44691))

(declare-fun c!5040 () Bool)

(assert (=> d!21764 (= c!5040 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21764 (= lt!109415 (_1!3105 e!44690))))

(declare-fun c!5041 () Bool)

(assert (=> d!21764 (= c!5041 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21764 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21764 (= (bitStreamReadBitsIntoList!0 (_2!3097 lt!108678) (_1!3098 lt!108679) #b0000000000000000000000000000000000000000000000000000000000000001) lt!109415)))

(declare-fun b!68351 () Bool)

(declare-datatypes ((tuple2!5990 0))(
  ( (tuple2!5991 (_1!3106 Bool) (_2!3106 BitStream!2282)) )
))
(declare-fun lt!109416 () tuple2!5990)

(declare-fun lt!109417 () (_ BitVec 64))

(assert (=> b!68351 (= e!44690 (tuple2!5989 (Cons!712 (_1!3106 lt!109416) (bitStreamReadBitsIntoList!0 (_2!3097 lt!108678) (_2!3106 lt!109416) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!109417))) (_2!3106 lt!109416)))))

(declare-fun readBit!0 (BitStream!2282) tuple2!5990)

(assert (=> b!68351 (= lt!109416 (readBit!0 (_1!3098 lt!108679)))))

(assert (=> b!68351 (= lt!109417 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!21764 c!5041) b!68350))

(assert (= (and d!21764 (not c!5041)) b!68351))

(assert (= (and d!21764 c!5040) b!68352))

(assert (= (and d!21764 (not c!5040)) b!68353))

(declare-fun m!109119 () Bool)

(assert (=> b!68352 m!109119))

(declare-fun m!109121 () Bool)

(assert (=> b!68353 m!109121))

(declare-fun m!109123 () Bool)

(assert (=> b!68351 m!109123))

(declare-fun m!109125 () Bool)

(assert (=> b!68351 m!109125))

(assert (=> b!68030 d!21764))

(declare-fun d!21766 () Bool)

(declare-fun e!44692 () Bool)

(assert (=> d!21766 e!44692))

(declare-fun res!56509 () Bool)

(assert (=> d!21766 (=> (not res!56509) (not e!44692))))

(declare-fun lt!109422 () (_ BitVec 64))

(declare-fun lt!109421 () (_ BitVec 64))

(declare-fun lt!109423 () (_ BitVec 64))

(assert (=> d!21766 (= res!56509 (= lt!109421 (bvsub lt!109422 lt!109423)))))

(assert (=> d!21766 (or (= (bvand lt!109422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109423 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109422 lt!109423) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21766 (= lt!109423 (remainingBits!0 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108678)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678)))))))

(declare-fun lt!109419 () (_ BitVec 64))

(declare-fun lt!109420 () (_ BitVec 64))

(assert (=> d!21766 (= lt!109422 (bvmul lt!109419 lt!109420))))

(assert (=> d!21766 (or (= lt!109419 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!109420 (bvsdiv (bvmul lt!109419 lt!109420) lt!109419)))))

(assert (=> d!21766 (= lt!109420 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21766 (= lt!109419 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108678)))))))

(assert (=> d!21766 (= lt!109421 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678)))))))

(assert (=> d!21766 (invariant!0 (currentBit!3399 (_2!3097 lt!108678)) (currentByte!3404 (_2!3097 lt!108678)) (size!1333 (buf!1714 (_2!3097 lt!108678))))))

(assert (=> d!21766 (= (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108678))) (currentByte!3404 (_2!3097 lt!108678)) (currentBit!3399 (_2!3097 lt!108678))) lt!109421)))

(declare-fun b!68354 () Bool)

(declare-fun res!56508 () Bool)

(assert (=> b!68354 (=> (not res!56508) (not e!44692))))

(assert (=> b!68354 (= res!56508 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!109421))))

(declare-fun b!68355 () Bool)

(declare-fun lt!109418 () (_ BitVec 64))

(assert (=> b!68355 (= e!44692 (bvsle lt!109421 (bvmul lt!109418 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68355 (or (= lt!109418 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!109418 #b0000000000000000000000000000000000000000000000000000000000001000) lt!109418)))))

(assert (=> b!68355 (= lt!109418 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108678)))))))

(assert (= (and d!21766 res!56509) b!68354))

(assert (= (and b!68354 res!56508) b!68355))

(assert (=> d!21766 m!108939))

(assert (=> d!21766 m!108533))

(assert (=> b!68043 d!21766))

(declare-fun d!21768 () Bool)

(assert (=> d!21768 (= (invariant!0 (currentBit!3399 (_2!3097 lt!108678)) (currentByte!3404 (_2!3097 lt!108678)) (size!1333 (buf!1714 (_2!3097 lt!108665)))) (and (bvsge (currentBit!3399 (_2!3097 lt!108678)) #b00000000000000000000000000000000) (bvslt (currentBit!3399 (_2!3097 lt!108678)) #b00000000000000000000000000001000) (bvsge (currentByte!3404 (_2!3097 lt!108678)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3404 (_2!3097 lt!108678)) (size!1333 (buf!1714 (_2!3097 lt!108665)))) (and (= (currentBit!3399 (_2!3097 lt!108678)) #b00000000000000000000000000000000) (= (currentByte!3404 (_2!3097 lt!108678)) (size!1333 (buf!1714 (_2!3097 lt!108665))))))))))

(assert (=> b!68032 d!21768))

(declare-fun d!21770 () Bool)

(assert (=> d!21770 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108665)))) ((_ sign_extend 32) (currentByte!3404 thiss!1379)) ((_ sign_extend 32) (currentBit!3399 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108665)))) ((_ sign_extend 32) (currentByte!3404 thiss!1379)) ((_ sign_extend 32) (currentBit!3399 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5256 () Bool)

(assert (= bs!5256 d!21770))

(declare-fun m!109127 () Bool)

(assert (=> bs!5256 m!109127))

(assert (=> b!68042 d!21770))

(declare-fun d!21772 () Bool)

(assert (=> d!21772 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108665)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678))) lt!108667) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108665)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678)))) lt!108667))))

(declare-fun bs!5257 () Bool)

(assert (= bs!5257 d!21772))

(declare-fun m!109129 () Bool)

(assert (=> bs!5257 m!109129))

(assert (=> b!68042 d!21772))

(declare-fun e!44694 () Bool)

(declare-fun lt!109439 () tuple2!5974)

(declare-fun b!68356 () Bool)

(declare-fun lt!109431 () (_ BitVec 64))

(declare-fun lt!109424 () (_ BitVec 64))

(assert (=> b!68356 (= e!44694 (= (_1!3098 lt!109439) (withMovedBitIndex!0 (_2!3098 lt!109439) (bvsub lt!109431 lt!109424))))))

(assert (=> b!68356 (or (= (bvand lt!109431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109424 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109431 lt!109424) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68356 (= lt!109424 (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108665))) (currentByte!3404 (_2!3097 lt!108665)) (currentBit!3399 (_2!3097 lt!108665))))))

(assert (=> b!68356 (= lt!109431 (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108678))) (currentByte!3404 (_2!3097 lt!108678)) (currentBit!3399 (_2!3097 lt!108678))))))

(declare-fun b!68357 () Bool)

(declare-fun res!56510 () Bool)

(assert (=> b!68357 (=> (not res!56510) (not e!44694))))

(assert (=> b!68357 (= res!56510 (isPrefixOf!0 (_2!3098 lt!109439) (_2!3097 lt!108665)))))

(declare-fun b!68358 () Bool)

(declare-fun res!56512 () Bool)

(assert (=> b!68358 (=> (not res!56512) (not e!44694))))

(assert (=> b!68358 (= res!56512 (isPrefixOf!0 (_1!3098 lt!109439) (_2!3097 lt!108678)))))

(declare-fun d!21774 () Bool)

(assert (=> d!21774 e!44694))

(declare-fun res!56511 () Bool)

(assert (=> d!21774 (=> (not res!56511) (not e!44694))))

(assert (=> d!21774 (= res!56511 (isPrefixOf!0 (_1!3098 lt!109439) (_2!3098 lt!109439)))))

(declare-fun lt!109427 () BitStream!2282)

(assert (=> d!21774 (= lt!109439 (tuple2!5975 lt!109427 (_2!3097 lt!108665)))))

(declare-fun lt!109436 () Unit!4575)

(declare-fun lt!109434 () Unit!4575)

(assert (=> d!21774 (= lt!109436 lt!109434)))

(assert (=> d!21774 (isPrefixOf!0 lt!109427 (_2!3097 lt!108665))))

(assert (=> d!21774 (= lt!109434 (lemmaIsPrefixTransitive!0 lt!109427 (_2!3097 lt!108665) (_2!3097 lt!108665)))))

(declare-fun lt!109438 () Unit!4575)

(declare-fun lt!109437 () Unit!4575)

(assert (=> d!21774 (= lt!109438 lt!109437)))

(assert (=> d!21774 (isPrefixOf!0 lt!109427 (_2!3097 lt!108665))))

(assert (=> d!21774 (= lt!109437 (lemmaIsPrefixTransitive!0 lt!109427 (_2!3097 lt!108678) (_2!3097 lt!108665)))))

(declare-fun lt!109432 () Unit!4575)

(declare-fun e!44693 () Unit!4575)

(assert (=> d!21774 (= lt!109432 e!44693)))

(declare-fun c!5042 () Bool)

(assert (=> d!21774 (= c!5042 (not (= (size!1333 (buf!1714 (_2!3097 lt!108678))) #b00000000000000000000000000000000)))))

(declare-fun lt!109428 () Unit!4575)

(declare-fun lt!109425 () Unit!4575)

(assert (=> d!21774 (= lt!109428 lt!109425)))

(assert (=> d!21774 (isPrefixOf!0 (_2!3097 lt!108665) (_2!3097 lt!108665))))

(assert (=> d!21774 (= lt!109425 (lemmaIsPrefixRefl!0 (_2!3097 lt!108665)))))

(declare-fun lt!109441 () Unit!4575)

(declare-fun lt!109433 () Unit!4575)

(assert (=> d!21774 (= lt!109441 lt!109433)))

(assert (=> d!21774 (= lt!109433 (lemmaIsPrefixRefl!0 (_2!3097 lt!108665)))))

(declare-fun lt!109430 () Unit!4575)

(declare-fun lt!109435 () Unit!4575)

(assert (=> d!21774 (= lt!109430 lt!109435)))

(assert (=> d!21774 (isPrefixOf!0 lt!109427 lt!109427)))

(assert (=> d!21774 (= lt!109435 (lemmaIsPrefixRefl!0 lt!109427))))

(declare-fun lt!109443 () Unit!4575)

(declare-fun lt!109426 () Unit!4575)

(assert (=> d!21774 (= lt!109443 lt!109426)))

(assert (=> d!21774 (isPrefixOf!0 (_2!3097 lt!108678) (_2!3097 lt!108678))))

(assert (=> d!21774 (= lt!109426 (lemmaIsPrefixRefl!0 (_2!3097 lt!108678)))))

(assert (=> d!21774 (= lt!109427 (BitStream!2283 (buf!1714 (_2!3097 lt!108665)) (currentByte!3404 (_2!3097 lt!108678)) (currentBit!3399 (_2!3097 lt!108678))))))

(assert (=> d!21774 (isPrefixOf!0 (_2!3097 lt!108678) (_2!3097 lt!108665))))

(assert (=> d!21774 (= (reader!0 (_2!3097 lt!108678) (_2!3097 lt!108665)) lt!109439)))

(declare-fun b!68359 () Bool)

(declare-fun lt!109440 () Unit!4575)

(assert (=> b!68359 (= e!44693 lt!109440)))

(declare-fun lt!109442 () (_ BitVec 64))

(assert (=> b!68359 (= lt!109442 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109429 () (_ BitVec 64))

(assert (=> b!68359 (= lt!109429 (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108678))) (currentByte!3404 (_2!3097 lt!108678)) (currentBit!3399 (_2!3097 lt!108678))))))

(assert (=> b!68359 (= lt!109440 (arrayBitRangesEqSymmetric!0 (buf!1714 (_2!3097 lt!108678)) (buf!1714 (_2!3097 lt!108665)) lt!109442 lt!109429))))

(assert (=> b!68359 (arrayBitRangesEq!0 (buf!1714 (_2!3097 lt!108665)) (buf!1714 (_2!3097 lt!108678)) lt!109442 lt!109429)))

(declare-fun b!68360 () Bool)

(declare-fun Unit!4595 () Unit!4575)

(assert (=> b!68360 (= e!44693 Unit!4595)))

(assert (= (and d!21774 c!5042) b!68359))

(assert (= (and d!21774 (not c!5042)) b!68360))

(assert (= (and d!21774 res!56511) b!68358))

(assert (= (and b!68358 res!56512) b!68357))

(assert (= (and b!68357 res!56510) b!68356))

(declare-fun m!109131 () Bool)

(assert (=> b!68357 m!109131))

(assert (=> b!68359 m!108497))

(declare-fun m!109133 () Bool)

(assert (=> b!68359 m!109133))

(declare-fun m!109135 () Bool)

(assert (=> b!68359 m!109135))

(declare-fun m!109137 () Bool)

(assert (=> b!68356 m!109137))

(assert (=> b!68356 m!108535))

(assert (=> b!68356 m!108497))

(declare-fun m!109139 () Bool)

(assert (=> b!68358 m!109139))

(assert (=> d!21774 m!108821))

(declare-fun m!109141 () Bool)

(assert (=> d!21774 m!109141))

(assert (=> d!21774 m!108819))

(declare-fun m!109143 () Bool)

(assert (=> d!21774 m!109143))

(declare-fun m!109145 () Bool)

(assert (=> d!21774 m!109145))

(declare-fun m!109147 () Bool)

(assert (=> d!21774 m!109147))

(declare-fun m!109149 () Bool)

(assert (=> d!21774 m!109149))

(declare-fun m!109151 () Bool)

(assert (=> d!21774 m!109151))

(declare-fun m!109153 () Bool)

(assert (=> d!21774 m!109153))

(assert (=> d!21774 m!108531))

(declare-fun m!109155 () Bool)

(assert (=> d!21774 m!109155))

(assert (=> b!68042 d!21774))

(declare-fun d!21776 () Bool)

(assert (=> d!21776 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108665)))) ((_ sign_extend 32) (currentByte!3404 (_2!3097 lt!108678))) ((_ sign_extend 32) (currentBit!3399 (_2!3097 lt!108678))) lt!108667)))

(declare-fun lt!109444 () Unit!4575)

(assert (=> d!21776 (= lt!109444 (choose!9 (_2!3097 lt!108678) (buf!1714 (_2!3097 lt!108665)) lt!108667 (BitStream!2283 (buf!1714 (_2!3097 lt!108665)) (currentByte!3404 (_2!3097 lt!108678)) (currentBit!3399 (_2!3097 lt!108678)))))))

(assert (=> d!21776 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3097 lt!108678) (buf!1714 (_2!3097 lt!108665)) lt!108667) lt!109444)))

(declare-fun bs!5258 () Bool)

(assert (= bs!5258 d!21776))

(assert (=> bs!5258 m!108509))

(declare-fun m!109157 () Bool)

(assert (=> bs!5258 m!109157))

(assert (=> b!68042 d!21776))

(declare-fun d!21778 () Bool)

(assert (=> d!21778 (validate_offset_bits!1 ((_ sign_extend 32) (size!1333 (buf!1714 (_2!3097 lt!108665)))) ((_ sign_extend 32) (currentByte!3404 thiss!1379)) ((_ sign_extend 32) (currentBit!3399 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!109445 () Unit!4575)

(assert (=> d!21778 (= lt!109445 (choose!9 thiss!1379 (buf!1714 (_2!3097 lt!108665)) (bvsub to!314 i!635) (BitStream!2283 (buf!1714 (_2!3097 lt!108665)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379))))))

(assert (=> d!21778 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1714 (_2!3097 lt!108665)) (bvsub to!314 i!635)) lt!109445)))

(declare-fun bs!5259 () Bool)

(assert (= bs!5259 d!21778))

(assert (=> bs!5259 m!108505))

(declare-fun m!109159 () Bool)

(assert (=> bs!5259 m!109159))

(assert (=> b!68042 d!21778))

(declare-fun b!68363 () Bool)

(declare-fun e!44696 () Bool)

(declare-fun lt!109446 () List!716)

(assert (=> b!68363 (= e!44696 (isEmpty!217 lt!109446))))

(declare-fun b!68364 () Bool)

(assert (=> b!68364 (= e!44696 (> (length!344 lt!109446) 0))))

(declare-fun b!68361 () Bool)

(declare-fun e!44695 () tuple2!5988)

(assert (=> b!68361 (= e!44695 (tuple2!5989 Nil!713 (_1!3098 lt!108674)))))

(declare-fun d!21780 () Bool)

(assert (=> d!21780 e!44696))

(declare-fun c!5043 () Bool)

(assert (=> d!21780 (= c!5043 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21780 (= lt!109446 (_1!3105 e!44695))))

(declare-fun c!5044 () Bool)

(assert (=> d!21780 (= c!5044 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21780 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21780 (= (bitStreamReadBitsIntoList!0 (_2!3097 lt!108665) (_1!3098 lt!108674) (bvsub to!314 i!635)) lt!109446)))

(declare-fun lt!109448 () (_ BitVec 64))

(declare-fun b!68362 () Bool)

(declare-fun lt!109447 () tuple2!5990)

(assert (=> b!68362 (= e!44695 (tuple2!5989 (Cons!712 (_1!3106 lt!109447) (bitStreamReadBitsIntoList!0 (_2!3097 lt!108665) (_2!3106 lt!109447) (bvsub (bvsub to!314 i!635) lt!109448))) (_2!3106 lt!109447)))))

(assert (=> b!68362 (= lt!109447 (readBit!0 (_1!3098 lt!108674)))))

(assert (=> b!68362 (= lt!109448 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!21780 c!5044) b!68361))

(assert (= (and d!21780 (not c!5044)) b!68362))

(assert (= (and d!21780 c!5043) b!68363))

(assert (= (and d!21780 (not c!5043)) b!68364))

(declare-fun m!109161 () Bool)

(assert (=> b!68363 m!109161))

(declare-fun m!109163 () Bool)

(assert (=> b!68364 m!109163))

(declare-fun m!109165 () Bool)

(assert (=> b!68362 m!109165))

(declare-fun m!109167 () Bool)

(assert (=> b!68362 m!109167))

(assert (=> b!68042 d!21780))

(declare-fun b!68367 () Bool)

(declare-fun e!44698 () Bool)

(declare-fun lt!109449 () List!716)

(assert (=> b!68367 (= e!44698 (isEmpty!217 lt!109449))))

(declare-fun b!68368 () Bool)

(assert (=> b!68368 (= e!44698 (> (length!344 lt!109449) 0))))

(declare-fun b!68365 () Bool)

(declare-fun e!44697 () tuple2!5988)

(assert (=> b!68365 (= e!44697 (tuple2!5989 Nil!713 (_1!3098 lt!108681)))))

(declare-fun d!21782 () Bool)

(assert (=> d!21782 e!44698))

(declare-fun c!5045 () Bool)

(assert (=> d!21782 (= c!5045 (= lt!108667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21782 (= lt!109449 (_1!3105 e!44697))))

(declare-fun c!5046 () Bool)

(assert (=> d!21782 (= c!5046 (= lt!108667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21782 (bvsge lt!108667 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21782 (= (bitStreamReadBitsIntoList!0 (_2!3097 lt!108665) (_1!3098 lt!108681) lt!108667) lt!109449)))

(declare-fun b!68366 () Bool)

(declare-fun lt!109451 () (_ BitVec 64))

(declare-fun lt!109450 () tuple2!5990)

(assert (=> b!68366 (= e!44697 (tuple2!5989 (Cons!712 (_1!3106 lt!109450) (bitStreamReadBitsIntoList!0 (_2!3097 lt!108665) (_2!3106 lt!109450) (bvsub lt!108667 lt!109451))) (_2!3106 lt!109450)))))

(assert (=> b!68366 (= lt!109450 (readBit!0 (_1!3098 lt!108681)))))

(assert (=> b!68366 (= lt!109451 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!21782 c!5046) b!68365))

(assert (= (and d!21782 (not c!5046)) b!68366))

(assert (= (and d!21782 c!5045) b!68367))

(assert (= (and d!21782 (not c!5045)) b!68368))

(declare-fun m!109169 () Bool)

(assert (=> b!68367 m!109169))

(declare-fun m!109171 () Bool)

(assert (=> b!68368 m!109171))

(declare-fun m!109173 () Bool)

(assert (=> b!68366 m!109173))

(declare-fun m!109175 () Bool)

(assert (=> b!68366 m!109175))

(assert (=> b!68042 d!21782))

(declare-fun b!68369 () Bool)

(declare-fun lt!109452 () (_ BitVec 64))

(declare-fun lt!109467 () tuple2!5974)

(declare-fun lt!109459 () (_ BitVec 64))

(declare-fun e!44700 () Bool)

(assert (=> b!68369 (= e!44700 (= (_1!3098 lt!109467) (withMovedBitIndex!0 (_2!3098 lt!109467) (bvsub lt!109459 lt!109452))))))

(assert (=> b!68369 (or (= (bvand lt!109459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109452 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!109459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!109459 lt!109452) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68369 (= lt!109452 (bitIndex!0 (size!1333 (buf!1714 (_2!3097 lt!108665))) (currentByte!3404 (_2!3097 lt!108665)) (currentBit!3399 (_2!3097 lt!108665))))))

(assert (=> b!68369 (= lt!109459 (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379)))))

(declare-fun b!68370 () Bool)

(declare-fun res!56513 () Bool)

(assert (=> b!68370 (=> (not res!56513) (not e!44700))))

(assert (=> b!68370 (= res!56513 (isPrefixOf!0 (_2!3098 lt!109467) (_2!3097 lt!108665)))))

(declare-fun b!68371 () Bool)

(declare-fun res!56515 () Bool)

(assert (=> b!68371 (=> (not res!56515) (not e!44700))))

(assert (=> b!68371 (= res!56515 (isPrefixOf!0 (_1!3098 lt!109467) thiss!1379))))

(declare-fun d!21784 () Bool)

(assert (=> d!21784 e!44700))

(declare-fun res!56514 () Bool)

(assert (=> d!21784 (=> (not res!56514) (not e!44700))))

(assert (=> d!21784 (= res!56514 (isPrefixOf!0 (_1!3098 lt!109467) (_2!3098 lt!109467)))))

(declare-fun lt!109455 () BitStream!2282)

(assert (=> d!21784 (= lt!109467 (tuple2!5975 lt!109455 (_2!3097 lt!108665)))))

(declare-fun lt!109464 () Unit!4575)

(declare-fun lt!109462 () Unit!4575)

(assert (=> d!21784 (= lt!109464 lt!109462)))

(assert (=> d!21784 (isPrefixOf!0 lt!109455 (_2!3097 lt!108665))))

(assert (=> d!21784 (= lt!109462 (lemmaIsPrefixTransitive!0 lt!109455 (_2!3097 lt!108665) (_2!3097 lt!108665)))))

(declare-fun lt!109466 () Unit!4575)

(declare-fun lt!109465 () Unit!4575)

(assert (=> d!21784 (= lt!109466 lt!109465)))

(assert (=> d!21784 (isPrefixOf!0 lt!109455 (_2!3097 lt!108665))))

(assert (=> d!21784 (= lt!109465 (lemmaIsPrefixTransitive!0 lt!109455 thiss!1379 (_2!3097 lt!108665)))))

(declare-fun lt!109460 () Unit!4575)

(declare-fun e!44699 () Unit!4575)

(assert (=> d!21784 (= lt!109460 e!44699)))

(declare-fun c!5047 () Bool)

(assert (=> d!21784 (= c!5047 (not (= (size!1333 (buf!1714 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!109456 () Unit!4575)

(declare-fun lt!109453 () Unit!4575)

(assert (=> d!21784 (= lt!109456 lt!109453)))

(assert (=> d!21784 (isPrefixOf!0 (_2!3097 lt!108665) (_2!3097 lt!108665))))

(assert (=> d!21784 (= lt!109453 (lemmaIsPrefixRefl!0 (_2!3097 lt!108665)))))

(declare-fun lt!109469 () Unit!4575)

(declare-fun lt!109461 () Unit!4575)

(assert (=> d!21784 (= lt!109469 lt!109461)))

(assert (=> d!21784 (= lt!109461 (lemmaIsPrefixRefl!0 (_2!3097 lt!108665)))))

(declare-fun lt!109458 () Unit!4575)

(declare-fun lt!109463 () Unit!4575)

(assert (=> d!21784 (= lt!109458 lt!109463)))

(assert (=> d!21784 (isPrefixOf!0 lt!109455 lt!109455)))

(assert (=> d!21784 (= lt!109463 (lemmaIsPrefixRefl!0 lt!109455))))

(declare-fun lt!109471 () Unit!4575)

(declare-fun lt!109454 () Unit!4575)

(assert (=> d!21784 (= lt!109471 lt!109454)))

(assert (=> d!21784 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21784 (= lt!109454 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21784 (= lt!109455 (BitStream!2283 (buf!1714 (_2!3097 lt!108665)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379)))))

(assert (=> d!21784 (isPrefixOf!0 thiss!1379 (_2!3097 lt!108665))))

(assert (=> d!21784 (= (reader!0 thiss!1379 (_2!3097 lt!108665)) lt!109467)))

(declare-fun b!68372 () Bool)

(declare-fun lt!109468 () Unit!4575)

(assert (=> b!68372 (= e!44699 lt!109468)))

(declare-fun lt!109470 () (_ BitVec 64))

(assert (=> b!68372 (= lt!109470 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!109457 () (_ BitVec 64))

(assert (=> b!68372 (= lt!109457 (bitIndex!0 (size!1333 (buf!1714 thiss!1379)) (currentByte!3404 thiss!1379) (currentBit!3399 thiss!1379)))))

(assert (=> b!68372 (= lt!109468 (arrayBitRangesEqSymmetric!0 (buf!1714 thiss!1379) (buf!1714 (_2!3097 lt!108665)) lt!109470 lt!109457))))

(assert (=> b!68372 (arrayBitRangesEq!0 (buf!1714 (_2!3097 lt!108665)) (buf!1714 thiss!1379) lt!109470 lt!109457)))

(declare-fun b!68373 () Bool)

(declare-fun Unit!4598 () Unit!4575)

(assert (=> b!68373 (= e!44699 Unit!4598)))

(assert (= (and d!21784 c!5047) b!68372))

(assert (= (and d!21784 (not c!5047)) b!68373))

(assert (= (and d!21784 res!56514) b!68371))

(assert (= (and b!68371 res!56515) b!68370))

(assert (= (and b!68370 res!56513) b!68369))

(declare-fun m!109177 () Bool)

(assert (=> b!68370 m!109177))

(assert (=> b!68372 m!108569))

(declare-fun m!109179 () Bool)

(assert (=> b!68372 m!109179))

(declare-fun m!109181 () Bool)

(assert (=> b!68372 m!109181))

(declare-fun m!109183 () Bool)

(assert (=> b!68369 m!109183))

(assert (=> b!68369 m!108535))

(assert (=> b!68369 m!108569))

(declare-fun m!109185 () Bool)

(assert (=> b!68371 m!109185))

(assert (=> d!21784 m!108567))

(declare-fun m!109187 () Bool)

(assert (=> d!21784 m!109187))

(assert (=> d!21784 m!108565))

(declare-fun m!109189 () Bool)

(assert (=> d!21784 m!109189))

(declare-fun m!109191 () Bool)

(assert (=> d!21784 m!109191))

(assert (=> d!21784 m!109147))

(declare-fun m!109193 () Bool)

(assert (=> d!21784 m!109193))

(declare-fun m!109195 () Bool)

(assert (=> d!21784 m!109195))

(declare-fun m!109197 () Bool)

(assert (=> d!21784 m!109197))

(assert (=> d!21784 m!108523))

(assert (=> d!21784 m!109155))

(assert (=> b!68042 d!21784))

(declare-fun d!21786 () Bool)

(assert (=> d!21786 (= (head!535 (byteArrayBitContentToList!0 (_2!3097 lt!108665) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!831 (byteArrayBitContentToList!0 (_2!3097 lt!108665) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!68044 d!21786))

(declare-fun d!21788 () Bool)

(declare-fun c!5048 () Bool)

(assert (=> d!21788 (= c!5048 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44701 () List!716)

(assert (=> d!21788 (= (byteArrayBitContentToList!0 (_2!3097 lt!108665) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!44701)))

(declare-fun b!68374 () Bool)

(assert (=> b!68374 (= e!44701 Nil!713)))

(declare-fun b!68375 () Bool)

(assert (=> b!68375 (= e!44701 (Cons!712 (not (= (bvand ((_ sign_extend 24) (select (arr!1906 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3097 lt!108665) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21788 c!5048) b!68374))

(assert (= (and d!21788 (not c!5048)) b!68375))

(assert (=> b!68375 m!108489))

(assert (=> b!68375 m!109085))

(declare-fun m!109199 () Bool)

(assert (=> b!68375 m!109199))

(assert (=> b!68044 d!21788))

(declare-fun d!21790 () Bool)

(assert (=> d!21790 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1906 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5260 () Bool)

(assert (= bs!5260 d!21790))

(assert (=> bs!5260 m!108489))

(assert (=> bs!5260 m!109085))

(assert (=> b!68044 d!21790))

(declare-fun d!21792 () Bool)

(assert (=> d!21792 (= (head!535 lt!108662) (h!831 lt!108662))))

(assert (=> b!68033 d!21792))

(declare-fun d!21794 () Bool)

(assert (=> d!21794 (= (array_inv!1200 (buf!1714 thiss!1379)) (bvsge (size!1333 (buf!1714 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!68035 d!21794))

(declare-fun d!21796 () Bool)

(assert (=> d!21796 (= (tail!320 lt!108662) (t!1466 lt!108662))))

(assert (=> b!68045 d!21796))

(declare-fun d!21798 () Bool)

(declare-fun e!44704 () Bool)

(assert (=> d!21798 e!44704))

(declare-fun res!56518 () Bool)

(assert (=> d!21798 (=> (not res!56518) (not e!44704))))

(declare-fun lt!109477 () (_ BitVec 64))

(assert (=> d!21798 (= res!56518 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109477 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!109477) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!21798 (= lt!109477 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!109476 () Unit!4575)

(declare-fun choose!42 (BitStream!2282 BitStream!2282 BitStream!2282 BitStream!2282 (_ BitVec 64) List!716) Unit!4575)

(assert (=> d!21798 (= lt!109476 (choose!42 (_2!3097 lt!108665) (_2!3097 lt!108665) (_1!3098 lt!108674) (_1!3098 lt!108681) (bvsub to!314 i!635) lt!108662))))

(assert (=> d!21798 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21798 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3097 lt!108665) (_2!3097 lt!108665) (_1!3098 lt!108674) (_1!3098 lt!108681) (bvsub to!314 i!635) lt!108662) lt!109476)))

(declare-fun b!68378 () Bool)

(assert (=> b!68378 (= e!44704 (= (bitStreamReadBitsIntoList!0 (_2!3097 lt!108665) (_1!3098 lt!108681) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!320 lt!108662)))))

(assert (= (and d!21798 res!56518) b!68378))

(declare-fun m!109201 () Bool)

(assert (=> d!21798 m!109201))

(declare-fun m!109203 () Bool)

(assert (=> b!68378 m!109203))

(assert (=> b!68378 m!108539))

(assert (=> b!68045 d!21798))

(push 1)

(assert (not b!68327))

(assert (not b!68217))

(assert (not b!68321))

(assert (not b!68371))

(assert (not b!68357))

(assert (not b!68378))

(assert (not d!21752))

(assert (not b!68191))

(assert (not d!21598))

(assert (not d!21680))

(assert (not b!68220))

(assert (not d!21660))

(assert (not b!68209))

(assert (not b!68320))

(assert (not b!68341))

(assert (not d!21776))

(assert (not d!21784))

(assert (not bm!874))

(assert (not b!68364))

(assert (not d!21676))

(assert (not b!68359))

(assert (not b!68081))

(assert (not b!68352))

(assert (not b!68375))

(assert (not b!68318))

(assert (not d!21672))

(assert (not d!21774))

(assert (not b!68215))

(assert (not b!68193))

(assert (not d!21754))

(assert (not b!68356))

(assert (not b!68353))

(assert (not b!68370))

(assert (not d!21740))

(assert (not b!68188))

(assert (not d!21662))

(assert (not b!68351))

(assert (not b!68208))

(assert (not d!21772))

(assert (not b!68362))

(assert (not b!68317))

(assert (not b!68325))

(assert (not b!68368))

(assert (not b!68363))

(assert (not d!21746))

(assert (not b!68210))

(assert (not d!21798))

(assert (not b!68207))

(assert (not d!21766))

(assert (not b!68323))

(assert (not b!68083))

(assert (not b!68366))

(assert (not b!68212))

(assert (not b!68214))

(assert (not b!68372))

(assert (not d!21678))

(assert (not d!21666))

(assert (not b!68322))

(assert (not d!21778))

(assert (not d!21770))

(assert (not b!68369))

(assert (not b!68192))

(assert (not b!68195))

(assert (not b!68324))

(assert (not d!21596))

(assert (not b!68358))

(assert (not b!68319))

(assert (not d!21756))

(assert (not b!68194))

(assert (not b!68367))

(check-sat)

(pop 1)

(push 1)

(check-sat)

