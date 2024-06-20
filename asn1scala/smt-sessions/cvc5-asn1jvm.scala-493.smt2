; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14658 () Bool)

(assert start!14658)

(declare-fun b!75522 () Bool)

(declare-fun res!62433 () Bool)

(declare-fun e!49386 () Bool)

(assert (=> b!75522 (=> (not res!62433) (not e!49386))))

(declare-datatypes ((array!3082 0))(
  ( (array!3083 (arr!2034 (Array (_ BitVec 32) (_ BitVec 8))) (size!1436 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2446 0))(
  ( (BitStream!2447 (buf!1817 array!3082) (currentByte!3599 (_ BitVec 32)) (currentBit!3594 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2446)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75522 (= res!62433 (validate_offset_bits!1 ((_ sign_extend 32) (size!1436 (buf!1817 thiss!1379))) ((_ sign_extend 32) (currentByte!3599 thiss!1379)) ((_ sign_extend 32) (currentBit!3594 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun e!49382 () Bool)

(declare-fun lt!121517 () (_ BitVec 64))

(declare-fun b!75523 () Bool)

(declare-fun lt!121515 () (_ BitVec 64))

(assert (=> b!75523 (= e!49382 (or (= lt!121515 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!121515 (bvand lt!121517 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!121513 () (_ BitVec 64))

(assert (=> b!75523 (= lt!121515 (bvand lt!121513 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun srcBuffer!2 () array!3082)

(declare-datatypes ((tuple2!6502 0))(
  ( (tuple2!6503 (_1!3379 array!3082) (_2!3379 BitStream!2446)) )
))
(declare-fun lt!121516 () tuple2!6502)

(declare-fun checkByteArrayBitContent!0 (BitStream!2446 array!3082 array!3082 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75523 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3379 lt!121516) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75524 () Bool)

(declare-fun e!49381 () Bool)

(declare-fun e!49383 () Bool)

(assert (=> b!75524 (= e!49381 e!49383)))

(declare-fun res!62432 () Bool)

(assert (=> b!75524 (=> res!62432 e!49383)))

(declare-fun lt!121518 () (_ BitVec 64))

(assert (=> b!75524 (= res!62432 (not (= lt!121518 lt!121517)))))

(assert (=> b!75524 (= lt!121517 (bvsub lt!121513 i!635))))

(assert (=> b!75524 (= lt!121513 (bvadd lt!121518 to!314))))

(declare-fun b!75525 () Bool)

(assert (=> b!75525 (= e!49386 (not e!49381))))

(declare-fun res!62437 () Bool)

(assert (=> b!75525 (=> res!62437 e!49381)))

(assert (=> b!75525 (= res!62437 (bvslt i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2446 BitStream!2446) Bool)

(assert (=> b!75525 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4969 0))(
  ( (Unit!4970) )
))
(declare-fun lt!121514 () Unit!4969)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2446) Unit!4969)

(assert (=> b!75525 (= lt!121514 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75525 (= lt!121518 (bitIndex!0 (size!1436 (buf!1817 thiss!1379)) (currentByte!3599 thiss!1379) (currentBit!3594 thiss!1379)))))

(declare-fun b!75526 () Bool)

(assert (=> b!75526 (= e!49383 e!49382)))

(declare-fun res!62436 () Bool)

(assert (=> b!75526 (=> res!62436 e!49382)))

(assert (=> b!75526 (= res!62436 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2446 (_ BitVec 64)) tuple2!6502)

(declare-datatypes ((tuple2!6504 0))(
  ( (tuple2!6505 (_1!3380 BitStream!2446) (_2!3380 BitStream!2446)) )
))
(declare-fun reader!0 (BitStream!2446 BitStream!2446) tuple2!6504)

(assert (=> b!75526 (= lt!121516 (readBits!0 (_1!3380 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!62435 () Bool)

(assert (=> start!14658 (=> (not res!62435) (not e!49386))))

(assert (=> start!14658 (= res!62435 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1436 srcBuffer!2))))))))

(assert (=> start!14658 e!49386))

(assert (=> start!14658 true))

(declare-fun array_inv!1282 (array!3082) Bool)

(assert (=> start!14658 (array_inv!1282 srcBuffer!2)))

(declare-fun e!49385 () Bool)

(declare-fun inv!12 (BitStream!2446) Bool)

(assert (=> start!14658 (and (inv!12 thiss!1379) e!49385)))

(declare-fun b!75527 () Bool)

(assert (=> b!75527 (= e!49385 (array_inv!1282 (buf!1817 thiss!1379)))))

(declare-fun b!75528 () Bool)

(declare-fun res!62434 () Bool)

(assert (=> b!75528 (=> res!62434 e!49383)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75528 (= res!62434 (not (invariant!0 (currentBit!3594 thiss!1379) (currentByte!3599 thiss!1379) (size!1436 (buf!1817 thiss!1379)))))))

(assert (= (and start!14658 res!62435) b!75522))

(assert (= (and b!75522 res!62433) b!75525))

(assert (= (and b!75525 (not res!62437)) b!75524))

(assert (= (and b!75524 (not res!62432)) b!75528))

(assert (= (and b!75528 (not res!62434)) b!75526))

(assert (= (and b!75526 (not res!62436)) b!75523))

(assert (= start!14658 b!75527))

(declare-fun m!120611 () Bool)

(assert (=> b!75525 m!120611))

(declare-fun m!120613 () Bool)

(assert (=> b!75525 m!120613))

(declare-fun m!120615 () Bool)

(assert (=> b!75525 m!120615))

(declare-fun m!120617 () Bool)

(assert (=> b!75522 m!120617))

(declare-fun m!120619 () Bool)

(assert (=> b!75523 m!120619))

(declare-fun m!120621 () Bool)

(assert (=> b!75528 m!120621))

(declare-fun m!120623 () Bool)

(assert (=> b!75527 m!120623))

(declare-fun m!120625 () Bool)

(assert (=> start!14658 m!120625))

(declare-fun m!120627 () Bool)

(assert (=> start!14658 m!120627))

(declare-fun m!120629 () Bool)

(assert (=> b!75526 m!120629))

(declare-fun m!120631 () Bool)

(assert (=> b!75526 m!120631))

(push 1)

(assert (not b!75523))

(assert (not b!75528))

(assert (not b!75527))

(assert (not b!75522))

(assert (not start!14658))

(assert (not b!75526))

(assert (not b!75525))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24032 () Bool)

(declare-fun res!62493 () Bool)

(declare-fun e!49442 () Bool)

(assert (=> d!24032 (=> res!62493 e!49442)))

(assert (=> d!24032 (= res!62493 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24032 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3379 lt!121516) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!49442)))

(declare-fun b!75590 () Bool)

(declare-fun e!49443 () Bool)

(assert (=> b!75590 (= e!49442 e!49443)))

(declare-fun res!62494 () Bool)

(assert (=> b!75590 (=> (not res!62494) (not e!49443))))

(assert (=> b!75590 (= res!62494 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2034 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2034 (_1!3379 lt!121516)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!75591 () Bool)

(assert (=> b!75591 (= e!49443 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3379 lt!121516) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!24032 (not res!62493)) b!75590))

(assert (= (and b!75590 res!62494) b!75591))

(declare-fun m!120683 () Bool)

(assert (=> b!75590 m!120683))

(declare-fun m!120685 () Bool)

(assert (=> b!75590 m!120685))

(declare-fun m!120687 () Bool)

(assert (=> b!75590 m!120687))

(declare-fun m!120689 () Bool)

(assert (=> b!75590 m!120689))

(declare-fun m!120691 () Bool)

(assert (=> b!75591 m!120691))

(assert (=> b!75523 d!24032))

(declare-fun d!24040 () Bool)

(assert (=> d!24040 (= (invariant!0 (currentBit!3594 thiss!1379) (currentByte!3599 thiss!1379) (size!1436 (buf!1817 thiss!1379))) (and (bvsge (currentBit!3594 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3594 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3599 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3599 thiss!1379) (size!1436 (buf!1817 thiss!1379))) (and (= (currentBit!3594 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3599 thiss!1379) (size!1436 (buf!1817 thiss!1379)))))))))

(assert (=> b!75528 d!24040))

(declare-fun d!24048 () Bool)

(assert (=> d!24048 (= (array_inv!1282 (buf!1817 thiss!1379)) (bvsge (size!1436 (buf!1817 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!75527 d!24048))

(declare-fun d!24050 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24050 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1436 (buf!1817 thiss!1379))) ((_ sign_extend 32) (currentByte!3599 thiss!1379)) ((_ sign_extend 32) (currentBit!3594 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1436 (buf!1817 thiss!1379))) ((_ sign_extend 32) (currentByte!3599 thiss!1379)) ((_ sign_extend 32) (currentBit!3594 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5779 () Bool)

(assert (= bs!5779 d!24050))

(declare-fun m!120695 () Bool)

(assert (=> bs!5779 m!120695))

(assert (=> b!75522 d!24050))

(declare-fun b!75642 () Bool)

(declare-fun res!62545 () Bool)

(declare-fun e!49456 () Bool)

(assert (=> b!75642 (=> (not res!62545) (not e!49456))))

(declare-fun lt!121694 () (_ BitVec 64))

(declare-fun lt!121693 () tuple2!6502)

(assert (=> b!75642 (= res!62545 (= (bvadd lt!121694 (bvsub to!314 i!635)) (bitIndex!0 (size!1436 (buf!1817 (_2!3379 lt!121693))) (currentByte!3599 (_2!3379 lt!121693)) (currentBit!3594 (_2!3379 lt!121693)))))))

(assert (=> b!75642 (or (not (= (bvand lt!121694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!121694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!121694 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75642 (= lt!121694 (bitIndex!0 (size!1436 (buf!1817 (_1!3380 (reader!0 thiss!1379 thiss!1379)))) (currentByte!3599 (_1!3380 (reader!0 thiss!1379 thiss!1379))) (currentBit!3594 (_1!3380 (reader!0 thiss!1379 thiss!1379)))))))

(declare-fun d!24056 () Bool)

(assert (=> d!24056 e!49456))

(declare-fun res!62541 () Bool)

(assert (=> d!24056 (=> (not res!62541) (not e!49456))))

(assert (=> d!24056 (= res!62541 (= (buf!1817 (_2!3379 lt!121693)) (buf!1817 (_1!3380 (reader!0 thiss!1379 thiss!1379)))))))

(declare-datatypes ((tuple3!218 0))(
  ( (tuple3!219 (_1!3387 Unit!4969) (_2!3387 BitStream!2446) (_3!130 array!3082)) )
))
(declare-fun lt!121688 () tuple3!218)

(assert (=> d!24056 (= lt!121693 (tuple2!6503 (_3!130 lt!121688) (_2!3387 lt!121688)))))

(declare-fun readBitsLoop!0 (BitStream!2446 (_ BitVec 64) array!3082 (_ BitVec 64) (_ BitVec 64)) tuple3!218)

(assert (=> d!24056 (= lt!121688 (readBitsLoop!0 (_1!3380 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635) (array!3083 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!24056 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24056 (= (readBits!0 (_1!3380 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)) lt!121693)))

(declare-fun b!75643 () Bool)

(declare-fun res!62543 () Bool)

(assert (=> b!75643 (=> (not res!62543) (not e!49456))))

(assert (=> b!75643 (= res!62543 (invariant!0 (currentBit!3594 (_2!3379 lt!121693)) (currentByte!3599 (_2!3379 lt!121693)) (size!1436 (buf!1817 (_2!3379 lt!121693)))))))

(declare-fun b!75644 () Bool)

(declare-fun res!62544 () Bool)

(assert (=> b!75644 (=> (not res!62544) (not e!49456))))

(assert (=> b!75644 (= res!62544 (bvsle (currentByte!3599 (_1!3380 (reader!0 thiss!1379 thiss!1379))) (currentByte!3599 (_2!3379 lt!121693))))))

(declare-fun b!75645 () Bool)

(declare-fun res!62542 () Bool)

(assert (=> b!75645 (=> (not res!62542) (not e!49456))))

(declare-fun lt!121690 () (_ BitVec 64))

(assert (=> b!75645 (= res!62542 (= (size!1436 (_1!3379 lt!121693)) ((_ extract 31 0) lt!121690)))))

(assert (=> b!75645 (and (bvslt lt!121690 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!121690 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!121695 () (_ BitVec 64))

(declare-fun lt!121691 () (_ BitVec 64))

(assert (=> b!75645 (= lt!121690 (bvsdiv lt!121695 lt!121691))))

(assert (=> b!75645 (and (not (= lt!121691 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!121695 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!121691 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!75645 (= lt!121691 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!121692 () (_ BitVec 64))

(declare-fun lt!121689 () (_ BitVec 64))

(assert (=> b!75645 (= lt!121695 (bvsub lt!121692 lt!121689))))

(assert (=> b!75645 (or (= (bvand lt!121692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121689 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121692 lt!121689) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75645 (= lt!121689 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!121696 () (_ BitVec 64))

(assert (=> b!75645 (= lt!121692 (bvadd (bvsub to!314 i!635) lt!121696))))

(assert (=> b!75645 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121696 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!121696) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75645 (= lt!121696 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!75646 () Bool)

(declare-datatypes ((List!782 0))(
  ( (Nil!779) (Cons!778 (h!897 Bool) (t!1532 List!782)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2446 array!3082 (_ BitVec 64) (_ BitVec 64)) List!782)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2446 BitStream!2446 (_ BitVec 64)) List!782)

(assert (=> b!75646 (= e!49456 (= (byteArrayBitContentToList!0 (_2!3379 lt!121693) (_1!3379 lt!121693) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3379 lt!121693) (_1!3380 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635))))))

(assert (= (and d!24056 res!62541) b!75642))

(assert (= (and b!75642 res!62545) b!75643))

(assert (= (and b!75643 res!62543) b!75645))

(assert (= (and b!75645 res!62542) b!75644))

(assert (= (and b!75644 res!62544) b!75646))

(declare-fun m!120721 () Bool)

(assert (=> b!75642 m!120721))

(declare-fun m!120723 () Bool)

(assert (=> b!75642 m!120723))

(declare-fun m!120725 () Bool)

(assert (=> d!24056 m!120725))

(declare-fun m!120727 () Bool)

(assert (=> b!75643 m!120727))

(declare-fun m!120729 () Bool)

(assert (=> b!75646 m!120729))

(declare-fun m!120731 () Bool)

(assert (=> b!75646 m!120731))

(assert (=> b!75526 d!24056))

(declare-fun d!24064 () Bool)

(declare-fun e!49488 () Bool)

(assert (=> d!24064 e!49488))

(declare-fun res!62587 () Bool)

(assert (=> d!24064 (=> (not res!62587) (not e!49488))))

(declare-fun lt!121823 () tuple2!6504)

(assert (=> d!24064 (= res!62587 (isPrefixOf!0 (_1!3380 lt!121823) (_2!3380 lt!121823)))))

(declare-fun lt!121827 () BitStream!2446)

(assert (=> d!24064 (= lt!121823 (tuple2!6505 lt!121827 thiss!1379))))

(declare-fun lt!121836 () Unit!4969)

(declare-fun lt!121828 () Unit!4969)

(assert (=> d!24064 (= lt!121836 lt!121828)))

(assert (=> d!24064 (isPrefixOf!0 lt!121827 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2446 BitStream!2446 BitStream!2446) Unit!4969)

(assert (=> d!24064 (= lt!121828 (lemmaIsPrefixTransitive!0 lt!121827 thiss!1379 thiss!1379))))

(declare-fun lt!121821 () Unit!4969)

(declare-fun lt!121834 () Unit!4969)

(assert (=> d!24064 (= lt!121821 lt!121834)))

(assert (=> d!24064 (isPrefixOf!0 lt!121827 thiss!1379)))

(assert (=> d!24064 (= lt!121834 (lemmaIsPrefixTransitive!0 lt!121827 thiss!1379 thiss!1379))))

(declare-fun lt!121819 () Unit!4969)

(declare-fun e!49487 () Unit!4969)

(assert (=> d!24064 (= lt!121819 e!49487)))

(declare-fun c!5540 () Bool)

(assert (=> d!24064 (= c!5540 (not (= (size!1436 (buf!1817 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!121832 () Unit!4969)

(declare-fun lt!121818 () Unit!4969)

(assert (=> d!24064 (= lt!121832 lt!121818)))

(assert (=> d!24064 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24064 (= lt!121818 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121831 () Unit!4969)

(declare-fun lt!121826 () Unit!4969)

(assert (=> d!24064 (= lt!121831 lt!121826)))

(assert (=> d!24064 (= lt!121826 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121835 () Unit!4969)

(declare-fun lt!121817 () Unit!4969)

(assert (=> d!24064 (= lt!121835 lt!121817)))

(assert (=> d!24064 (isPrefixOf!0 lt!121827 lt!121827)))

(assert (=> d!24064 (= lt!121817 (lemmaIsPrefixRefl!0 lt!121827))))

(declare-fun lt!121824 () Unit!4969)

(declare-fun lt!121829 () Unit!4969)

(assert (=> d!24064 (= lt!121824 lt!121829)))

(assert (=> d!24064 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24064 (= lt!121829 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!24064 (= lt!121827 (BitStream!2447 (buf!1817 thiss!1379) (currentByte!3599 thiss!1379) (currentBit!3594 thiss!1379)))))

(assert (=> d!24064 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24064 (= (reader!0 thiss!1379 thiss!1379) lt!121823)))

(declare-fun b!75698 () Bool)

(declare-fun Unit!4976 () Unit!4969)

(assert (=> b!75698 (= e!49487 Unit!4976)))

(declare-fun b!75699 () Bool)

(declare-fun lt!121820 () (_ BitVec 64))

(declare-fun lt!121833 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2446 (_ BitVec 64)) BitStream!2446)

(assert (=> b!75699 (= e!49488 (= (_1!3380 lt!121823) (withMovedBitIndex!0 (_2!3380 lt!121823) (bvsub lt!121833 lt!121820))))))

(assert (=> b!75699 (or (= (bvand lt!121833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121820 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121833 lt!121820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75699 (= lt!121820 (bitIndex!0 (size!1436 (buf!1817 thiss!1379)) (currentByte!3599 thiss!1379) (currentBit!3594 thiss!1379)))))

(assert (=> b!75699 (= lt!121833 (bitIndex!0 (size!1436 (buf!1817 thiss!1379)) (currentByte!3599 thiss!1379) (currentBit!3594 thiss!1379)))))

(declare-fun b!75700 () Bool)

(declare-fun lt!121830 () Unit!4969)

(assert (=> b!75700 (= e!49487 lt!121830)))

(declare-fun lt!121822 () (_ BitVec 64))

(assert (=> b!75700 (= lt!121822 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121825 () (_ BitVec 64))

(assert (=> b!75700 (= lt!121825 (bitIndex!0 (size!1436 (buf!1817 thiss!1379)) (currentByte!3599 thiss!1379) (currentBit!3594 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3082 array!3082 (_ BitVec 64) (_ BitVec 64)) Unit!4969)

(assert (=> b!75700 (= lt!121830 (arrayBitRangesEqSymmetric!0 (buf!1817 thiss!1379) (buf!1817 thiss!1379) lt!121822 lt!121825))))

(declare-fun arrayBitRangesEq!0 (array!3082 array!3082 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75700 (arrayBitRangesEq!0 (buf!1817 thiss!1379) (buf!1817 thiss!1379) lt!121822 lt!121825)))

(declare-fun b!75701 () Bool)

(declare-fun res!62586 () Bool)

(assert (=> b!75701 (=> (not res!62586) (not e!49488))))

(assert (=> b!75701 (= res!62586 (isPrefixOf!0 (_2!3380 lt!121823) thiss!1379))))

(declare-fun b!75702 () Bool)

(declare-fun res!62585 () Bool)

(assert (=> b!75702 (=> (not res!62585) (not e!49488))))

(assert (=> b!75702 (= res!62585 (isPrefixOf!0 (_1!3380 lt!121823) thiss!1379))))

(assert (= (and d!24064 c!5540) b!75700))

(assert (= (and d!24064 (not c!5540)) b!75698))

(assert (= (and d!24064 res!62587) b!75702))

(assert (= (and b!75702 res!62585) b!75701))

(assert (= (and b!75701 res!62586) b!75699))

(declare-fun m!120795 () Bool)

(assert (=> d!24064 m!120795))

(assert (=> d!24064 m!120611))

(assert (=> d!24064 m!120611))

(assert (=> d!24064 m!120613))

(assert (=> d!24064 m!120611))

(declare-fun m!120797 () Bool)

(assert (=> d!24064 m!120797))

(assert (=> d!24064 m!120795))

(assert (=> d!24064 m!120613))

(declare-fun m!120799 () Bool)

(assert (=> d!24064 m!120799))

(declare-fun m!120801 () Bool)

(assert (=> d!24064 m!120801))

(declare-fun m!120803 () Bool)

(assert (=> d!24064 m!120803))

(assert (=> b!75700 m!120615))

(declare-fun m!120805 () Bool)

(assert (=> b!75700 m!120805))

(declare-fun m!120807 () Bool)

(assert (=> b!75700 m!120807))

(declare-fun m!120809 () Bool)

(assert (=> b!75701 m!120809))

(declare-fun m!120811 () Bool)

(assert (=> b!75702 m!120811))

(declare-fun m!120813 () Bool)

(assert (=> b!75699 m!120813))

(assert (=> b!75699 m!120615))

(assert (=> b!75699 m!120615))

(assert (=> b!75526 d!24064))

(declare-fun d!24074 () Bool)

(declare-fun res!62596 () Bool)

(declare-fun e!49493 () Bool)

(assert (=> d!24074 (=> (not res!62596) (not e!49493))))

(assert (=> d!24074 (= res!62596 (= (size!1436 (buf!1817 thiss!1379)) (size!1436 (buf!1817 thiss!1379))))))

(assert (=> d!24074 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!49493)))

(declare-fun b!75709 () Bool)

(declare-fun res!62595 () Bool)

(assert (=> b!75709 (=> (not res!62595) (not e!49493))))

(assert (=> b!75709 (= res!62595 (bvsle (bitIndex!0 (size!1436 (buf!1817 thiss!1379)) (currentByte!3599 thiss!1379) (currentBit!3594 thiss!1379)) (bitIndex!0 (size!1436 (buf!1817 thiss!1379)) (currentByte!3599 thiss!1379) (currentBit!3594 thiss!1379))))))

(declare-fun b!75710 () Bool)

(declare-fun e!49494 () Bool)

(assert (=> b!75710 (= e!49493 e!49494)))

(declare-fun res!62594 () Bool)

(assert (=> b!75710 (=> res!62594 e!49494)))

(assert (=> b!75710 (= res!62594 (= (size!1436 (buf!1817 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!75711 () Bool)

(assert (=> b!75711 (= e!49494 (arrayBitRangesEq!0 (buf!1817 thiss!1379) (buf!1817 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1436 (buf!1817 thiss!1379)) (currentByte!3599 thiss!1379) (currentBit!3594 thiss!1379))))))

(assert (= (and d!24074 res!62596) b!75709))

(assert (= (and b!75709 res!62595) b!75710))

(assert (= (and b!75710 (not res!62594)) b!75711))

(assert (=> b!75709 m!120615))

(assert (=> b!75709 m!120615))

(assert (=> b!75711 m!120615))

(assert (=> b!75711 m!120615))

(declare-fun m!120817 () Bool)

(assert (=> b!75711 m!120817))

(assert (=> b!75525 d!24074))

(declare-fun d!24078 () Bool)

(assert (=> d!24078 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!121842 () Unit!4969)

(declare-fun choose!11 (BitStream!2446) Unit!4969)

(assert (=> d!24078 (= lt!121842 (choose!11 thiss!1379))))

(assert (=> d!24078 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!121842)))

(declare-fun bs!5783 () Bool)

(assert (= bs!5783 d!24078))

(assert (=> bs!5783 m!120611))

(declare-fun m!120819 () Bool)

(assert (=> bs!5783 m!120819))

(assert (=> b!75525 d!24078))

(declare-fun d!24080 () Bool)

(declare-fun e!49500 () Bool)

(assert (=> d!24080 e!49500))

(declare-fun res!62608 () Bool)

(assert (=> d!24080 (=> (not res!62608) (not e!49500))))

(declare-fun lt!121878 () (_ BitVec 64))

(declare-fun lt!121877 () (_ BitVec 64))

(declare-fun lt!121876 () (_ BitVec 64))

(assert (=> d!24080 (= res!62608 (= lt!121876 (bvsub lt!121878 lt!121877)))))

(assert (=> d!24080 (or (= (bvand lt!121878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121877 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121878 lt!121877) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24080 (= lt!121877 (remainingBits!0 ((_ sign_extend 32) (size!1436 (buf!1817 thiss!1379))) ((_ sign_extend 32) (currentByte!3599 thiss!1379)) ((_ sign_extend 32) (currentBit!3594 thiss!1379))))))

(declare-fun lt!121873 () (_ BitVec 64))

(declare-fun lt!121874 () (_ BitVec 64))

(assert (=> d!24080 (= lt!121878 (bvmul lt!121873 lt!121874))))

(assert (=> d!24080 (or (= lt!121873 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!121874 (bvsdiv (bvmul lt!121873 lt!121874) lt!121873)))))

(assert (=> d!24080 (= lt!121874 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24080 (= lt!121873 ((_ sign_extend 32) (size!1436 (buf!1817 thiss!1379))))))

(assert (=> d!24080 (= lt!121876 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3599 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3594 thiss!1379))))))

(assert (=> d!24080 (invariant!0 (currentBit!3594 thiss!1379) (currentByte!3599 thiss!1379) (size!1436 (buf!1817 thiss!1379)))))

(assert (=> d!24080 (= (bitIndex!0 (size!1436 (buf!1817 thiss!1379)) (currentByte!3599 thiss!1379) (currentBit!3594 thiss!1379)) lt!121876)))

(declare-fun b!75722 () Bool)

(declare-fun res!62607 () Bool)

(assert (=> b!75722 (=> (not res!62607) (not e!49500))))

(assert (=> b!75722 (= res!62607 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!121876))))

(declare-fun b!75723 () Bool)

(declare-fun lt!121875 () (_ BitVec 64))

(assert (=> b!75723 (= e!49500 (bvsle lt!121876 (bvmul lt!121875 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75723 (or (= lt!121875 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!121875 #b0000000000000000000000000000000000000000000000000000000000001000) lt!121875)))))

(assert (=> b!75723 (= lt!121875 ((_ sign_extend 32) (size!1436 (buf!1817 thiss!1379))))))

(assert (= (and d!24080 res!62608) b!75722))

(assert (= (and b!75722 res!62607) b!75723))

(assert (=> d!24080 m!120695))

(assert (=> d!24080 m!120621))

(assert (=> b!75525 d!24080))

(declare-fun d!24082 () Bool)

(assert (=> d!24082 (= (array_inv!1282 srcBuffer!2) (bvsge (size!1436 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14658 d!24082))

(declare-fun d!24084 () Bool)

(assert (=> d!24084 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3594 thiss!1379) (currentByte!3599 thiss!1379) (size!1436 (buf!1817 thiss!1379))))))

(declare-fun bs!5784 () Bool)

(assert (= bs!5784 d!24084))

(assert (=> bs!5784 m!120621))

(assert (=> start!14658 d!24084))

(push 1)

(assert (not b!75699))

(assert (not b!75642))

(assert (not b!75711))

(assert (not d!24064))

(assert (not b!75643))

(assert (not b!75709))

(assert (not b!75591))

(assert (not d!24050))

(assert (not d!24084))

(assert (not b!75702))

(assert (not b!75701))

(assert (not b!75700))

(assert (not d!24078))

(assert (not d!24056))

(assert (not b!75646))

(assert (not d!24080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

