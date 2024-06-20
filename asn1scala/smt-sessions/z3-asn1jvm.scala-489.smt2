; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14360 () Bool)

(assert start!14360)

(declare-datatypes ((array!3048 0))(
  ( (array!3049 (arr!2019 (Array (_ BitVec 32) (_ BitVec 8))) (size!1425 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3048)

(declare-fun e!48764 () Bool)

(declare-datatypes ((BitStream!2424 0))(
  ( (BitStream!2425 (buf!1806 array!3048) (currentByte!3550 (_ BitVec 32)) (currentBit!3545 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2424)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((tuple2!6442 0))(
  ( (tuple2!6443 (_1!3335 array!3048) (_2!3335 BitStream!2424)) )
))
(declare-fun lt!119770 () tuple2!6442)

(declare-fun b!74507 () Bool)

(declare-fun checkByteArrayBitContent!0 (BitStream!2424 array!3048 array!3048 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74507 (= e!48764 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3335 lt!119770) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(declare-fun b!74508 () Bool)

(declare-fun e!48763 () Bool)

(declare-fun array_inv!1271 (array!3048) Bool)

(assert (=> b!74508 (= e!48763 (array_inv!1271 (buf!1806 thiss!1379)))))

(declare-fun res!61589 () Bool)

(declare-fun e!48759 () Bool)

(assert (=> start!14360 (=> (not res!61589) (not e!48759))))

(assert (=> start!14360 (= res!61589 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1425 srcBuffer!2))))))))

(assert (=> start!14360 e!48759))

(assert (=> start!14360 true))

(assert (=> start!14360 (array_inv!1271 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2424) Bool)

(assert (=> start!14360 (and (inv!12 thiss!1379) e!48763)))

(declare-fun b!74509 () Bool)

(declare-fun res!61590 () Bool)

(declare-fun e!48761 () Bool)

(assert (=> b!74509 (=> res!61590 e!48761)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74509 (= res!61590 (not (invariant!0 (currentBit!3545 thiss!1379) (currentByte!3550 thiss!1379) (size!1425 (buf!1806 thiss!1379)))))))

(declare-fun b!74510 () Bool)

(declare-fun res!61586 () Bool)

(assert (=> b!74510 (=> (not res!61586) (not e!48759))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74510 (= res!61586 (validate_offset_bits!1 ((_ sign_extend 32) (size!1425 (buf!1806 thiss!1379))) ((_ sign_extend 32) (currentByte!3550 thiss!1379)) ((_ sign_extend 32) (currentBit!3545 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74511 () Bool)

(assert (=> b!74511 (= e!48761 e!48764)))

(declare-fun res!61588 () Bool)

(assert (=> b!74511 (=> res!61588 e!48764)))

(assert (=> b!74511 (= res!61588 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2424 (_ BitVec 64)) tuple2!6442)

(declare-datatypes ((tuple2!6444 0))(
  ( (tuple2!6445 (_1!3336 BitStream!2424) (_2!3336 BitStream!2424)) )
))
(declare-fun reader!0 (BitStream!2424 BitStream!2424) tuple2!6444)

(assert (=> b!74511 (= lt!119770 (readBits!0 (_1!3336 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74512 () Bool)

(assert (=> b!74512 (= e!48759 (not e!48761))))

(declare-fun res!61587 () Bool)

(assert (=> b!74512 (=> res!61587 e!48761)))

(declare-fun lt!119769 () (_ BitVec 64))

(assert (=> b!74512 (= res!61587 (or (bvslt i!635 to!314) (not (= lt!119769 (bvsub (bvadd lt!119769 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2424 BitStream!2424) Bool)

(assert (=> b!74512 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4927 0))(
  ( (Unit!4928) )
))
(declare-fun lt!119768 () Unit!4927)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2424) Unit!4927)

(assert (=> b!74512 (= lt!119768 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74512 (= lt!119769 (bitIndex!0 (size!1425 (buf!1806 thiss!1379)) (currentByte!3550 thiss!1379) (currentBit!3545 thiss!1379)))))

(assert (= (and start!14360 res!61589) b!74510))

(assert (= (and b!74510 res!61586) b!74512))

(assert (= (and b!74512 (not res!61587)) b!74509))

(assert (= (and b!74509 (not res!61590)) b!74511))

(assert (= (and b!74511 (not res!61588)) b!74507))

(assert (= start!14360 b!74508))

(declare-fun m!119501 () Bool)

(assert (=> b!74507 m!119501))

(declare-fun m!119503 () Bool)

(assert (=> b!74508 m!119503))

(declare-fun m!119505 () Bool)

(assert (=> b!74509 m!119505))

(declare-fun m!119507 () Bool)

(assert (=> b!74510 m!119507))

(declare-fun m!119509 () Bool)

(assert (=> b!74511 m!119509))

(declare-fun m!119511 () Bool)

(assert (=> b!74511 m!119511))

(declare-fun m!119513 () Bool)

(assert (=> b!74512 m!119513))

(declare-fun m!119515 () Bool)

(assert (=> b!74512 m!119515))

(declare-fun m!119517 () Bool)

(assert (=> b!74512 m!119517))

(declare-fun m!119519 () Bool)

(assert (=> start!14360 m!119519))

(declare-fun m!119521 () Bool)

(assert (=> start!14360 m!119521))

(check-sat (not b!74509) (not b!74507) (not b!74511) (not b!74508) (not b!74512) (not b!74510) (not start!14360))
(check-sat)
(get-model)

(declare-fun d!23652 () Bool)

(declare-fun res!61614 () Bool)

(declare-fun e!48787 () Bool)

(assert (=> d!23652 (=> (not res!61614) (not e!48787))))

(assert (=> d!23652 (= res!61614 (= (size!1425 (buf!1806 thiss!1379)) (size!1425 (buf!1806 thiss!1379))))))

(assert (=> d!23652 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48787)))

(declare-fun b!74537 () Bool)

(declare-fun res!61613 () Bool)

(assert (=> b!74537 (=> (not res!61613) (not e!48787))))

(assert (=> b!74537 (= res!61613 (bvsle (bitIndex!0 (size!1425 (buf!1806 thiss!1379)) (currentByte!3550 thiss!1379) (currentBit!3545 thiss!1379)) (bitIndex!0 (size!1425 (buf!1806 thiss!1379)) (currentByte!3550 thiss!1379) (currentBit!3545 thiss!1379))))))

(declare-fun b!74538 () Bool)

(declare-fun e!48788 () Bool)

(assert (=> b!74538 (= e!48787 e!48788)))

(declare-fun res!61612 () Bool)

(assert (=> b!74538 (=> res!61612 e!48788)))

(assert (=> b!74538 (= res!61612 (= (size!1425 (buf!1806 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74539 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3048 array!3048 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74539 (= e!48788 (arrayBitRangesEq!0 (buf!1806 thiss!1379) (buf!1806 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1425 (buf!1806 thiss!1379)) (currentByte!3550 thiss!1379) (currentBit!3545 thiss!1379))))))

(assert (= (and d!23652 res!61614) b!74537))

(assert (= (and b!74537 res!61613) b!74538))

(assert (= (and b!74538 (not res!61612)) b!74539))

(assert (=> b!74537 m!119517))

(assert (=> b!74537 m!119517))

(assert (=> b!74539 m!119517))

(assert (=> b!74539 m!119517))

(declare-fun m!119545 () Bool)

(assert (=> b!74539 m!119545))

(assert (=> b!74512 d!23652))

(declare-fun d!23654 () Bool)

(assert (=> d!23654 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!119782 () Unit!4927)

(declare-fun choose!11 (BitStream!2424) Unit!4927)

(assert (=> d!23654 (= lt!119782 (choose!11 thiss!1379))))

(assert (=> d!23654 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!119782)))

(declare-fun bs!5698 () Bool)

(assert (= bs!5698 d!23654))

(assert (=> bs!5698 m!119513))

(declare-fun m!119547 () Bool)

(assert (=> bs!5698 m!119547))

(assert (=> b!74512 d!23654))

(declare-fun d!23656 () Bool)

(declare-fun e!48791 () Bool)

(assert (=> d!23656 e!48791))

(declare-fun res!61619 () Bool)

(assert (=> d!23656 (=> (not res!61619) (not e!48791))))

(declare-fun lt!119796 () (_ BitVec 64))

(declare-fun lt!119798 () (_ BitVec 64))

(declare-fun lt!119797 () (_ BitVec 64))

(assert (=> d!23656 (= res!61619 (= lt!119796 (bvsub lt!119797 lt!119798)))))

(assert (=> d!23656 (or (= (bvand lt!119797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119798 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119797 lt!119798) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23656 (= lt!119798 (remainingBits!0 ((_ sign_extend 32) (size!1425 (buf!1806 thiss!1379))) ((_ sign_extend 32) (currentByte!3550 thiss!1379)) ((_ sign_extend 32) (currentBit!3545 thiss!1379))))))

(declare-fun lt!119800 () (_ BitVec 64))

(declare-fun lt!119795 () (_ BitVec 64))

(assert (=> d!23656 (= lt!119797 (bvmul lt!119800 lt!119795))))

(assert (=> d!23656 (or (= lt!119800 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119795 (bvsdiv (bvmul lt!119800 lt!119795) lt!119800)))))

(assert (=> d!23656 (= lt!119795 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23656 (= lt!119800 ((_ sign_extend 32) (size!1425 (buf!1806 thiss!1379))))))

(assert (=> d!23656 (= lt!119796 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3550 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3545 thiss!1379))))))

(assert (=> d!23656 (invariant!0 (currentBit!3545 thiss!1379) (currentByte!3550 thiss!1379) (size!1425 (buf!1806 thiss!1379)))))

(assert (=> d!23656 (= (bitIndex!0 (size!1425 (buf!1806 thiss!1379)) (currentByte!3550 thiss!1379) (currentBit!3545 thiss!1379)) lt!119796)))

(declare-fun b!74544 () Bool)

(declare-fun res!61620 () Bool)

(assert (=> b!74544 (=> (not res!61620) (not e!48791))))

(assert (=> b!74544 (= res!61620 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!119796))))

(declare-fun b!74545 () Bool)

(declare-fun lt!119799 () (_ BitVec 64))

(assert (=> b!74545 (= e!48791 (bvsle lt!119796 (bvmul lt!119799 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74545 (or (= lt!119799 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!119799 #b0000000000000000000000000000000000000000000000000000000000001000) lt!119799)))))

(assert (=> b!74545 (= lt!119799 ((_ sign_extend 32) (size!1425 (buf!1806 thiss!1379))))))

(assert (= (and d!23656 res!61619) b!74544))

(assert (= (and b!74544 res!61620) b!74545))

(declare-fun m!119551 () Bool)

(assert (=> d!23656 m!119551))

(assert (=> d!23656 m!119505))

(assert (=> b!74512 d!23656))

(declare-fun d!23662 () Bool)

(declare-fun res!61634 () Bool)

(declare-fun e!48802 () Bool)

(assert (=> d!23662 (=> res!61634 e!48802)))

(assert (=> d!23662 (= res!61634 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23662 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3335 lt!119770) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!48802)))

(declare-fun b!74559 () Bool)

(declare-fun e!48803 () Bool)

(assert (=> b!74559 (= e!48802 e!48803)))

(declare-fun res!61635 () Bool)

(assert (=> b!74559 (=> (not res!61635) (not e!48803))))

(assert (=> b!74559 (= res!61635 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2019 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2019 (_1!3335 lt!119770)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!74560 () Bool)

(assert (=> b!74560 (= e!48803 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3335 lt!119770) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23662 (not res!61634)) b!74559))

(assert (= (and b!74559 res!61635) b!74560))

(declare-fun m!119557 () Bool)

(assert (=> b!74559 m!119557))

(declare-fun m!119559 () Bool)

(assert (=> b!74559 m!119559))

(declare-fun m!119561 () Bool)

(assert (=> b!74559 m!119561))

(declare-fun m!119563 () Bool)

(assert (=> b!74559 m!119563))

(declare-fun m!119565 () Bool)

(assert (=> b!74560 m!119565))

(assert (=> b!74507 d!23662))

(declare-fun d!23670 () Bool)

(assert (=> d!23670 (= (array_inv!1271 srcBuffer!2) (bvsge (size!1425 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14360 d!23670))

(declare-fun d!23672 () Bool)

(assert (=> d!23672 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3545 thiss!1379) (currentByte!3550 thiss!1379) (size!1425 (buf!1806 thiss!1379))))))

(declare-fun bs!5702 () Bool)

(assert (= bs!5702 d!23672))

(assert (=> bs!5702 m!119505))

(assert (=> start!14360 d!23672))

(declare-fun b!74598 () Bool)

(declare-fun e!48824 () Bool)

(declare-fun lt!119869 () tuple2!6442)

(declare-datatypes ((List!768 0))(
  ( (Nil!765) (Cons!764 (h!883 Bool) (t!1518 List!768)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2424 array!3048 (_ BitVec 64) (_ BitVec 64)) List!768)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2424 BitStream!2424 (_ BitVec 64)) List!768)

(assert (=> b!74598 (= e!48824 (= (byteArrayBitContentToList!0 (_2!3335 lt!119869) (_1!3335 lt!119869) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3335 lt!119869) (_1!3336 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635))))))

(declare-fun b!74599 () Bool)

(declare-fun res!61673 () Bool)

(assert (=> b!74599 (=> (not res!61673) (not e!48824))))

(declare-fun lt!119861 () (_ BitVec 64))

(assert (=> b!74599 (= res!61673 (= (bvadd lt!119861 (bvsub to!314 i!635)) (bitIndex!0 (size!1425 (buf!1806 (_2!3335 lt!119869))) (currentByte!3550 (_2!3335 lt!119869)) (currentBit!3545 (_2!3335 lt!119869)))))))

(assert (=> b!74599 (or (not (= (bvand lt!119861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!119861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!119861 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74599 (= lt!119861 (bitIndex!0 (size!1425 (buf!1806 (_1!3336 (reader!0 thiss!1379 thiss!1379)))) (currentByte!3550 (_1!3336 (reader!0 thiss!1379 thiss!1379))) (currentBit!3545 (_1!3336 (reader!0 thiss!1379 thiss!1379)))))))

(declare-fun b!74600 () Bool)

(declare-fun res!61677 () Bool)

(assert (=> b!74600 (=> (not res!61677) (not e!48824))))

(assert (=> b!74600 (= res!61677 (bvsle (currentByte!3550 (_1!3336 (reader!0 thiss!1379 thiss!1379))) (currentByte!3550 (_2!3335 lt!119869))))))

(declare-fun d!23674 () Bool)

(assert (=> d!23674 e!48824))

(declare-fun res!61675 () Bool)

(assert (=> d!23674 (=> (not res!61675) (not e!48824))))

(assert (=> d!23674 (= res!61675 (= (buf!1806 (_2!3335 lt!119869)) (buf!1806 (_1!3336 (reader!0 thiss!1379 thiss!1379)))))))

(declare-datatypes ((tuple3!190 0))(
  ( (tuple3!191 (_1!3339 Unit!4927) (_2!3339 BitStream!2424) (_3!114 array!3048)) )
))
(declare-fun lt!119866 () tuple3!190)

(assert (=> d!23674 (= lt!119869 (tuple2!6443 (_3!114 lt!119866) (_2!3339 lt!119866)))))

(declare-fun readBitsLoop!0 (BitStream!2424 (_ BitVec 64) array!3048 (_ BitVec 64) (_ BitVec 64)) tuple3!190)

(assert (=> d!23674 (= lt!119866 (readBitsLoop!0 (_1!3336 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635) (array!3049 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23674 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23674 (= (readBits!0 (_1!3336 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)) lt!119869)))

(declare-fun b!74601 () Bool)

(declare-fun res!61674 () Bool)

(assert (=> b!74601 (=> (not res!61674) (not e!48824))))

(declare-fun lt!119864 () (_ BitVec 64))

(assert (=> b!74601 (= res!61674 (= (size!1425 (_1!3335 lt!119869)) ((_ extract 31 0) lt!119864)))))

(assert (=> b!74601 (and (bvslt lt!119864 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!119864 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!119863 () (_ BitVec 64))

(declare-fun lt!119867 () (_ BitVec 64))

(assert (=> b!74601 (= lt!119864 (bvsdiv lt!119863 lt!119867))))

(assert (=> b!74601 (and (not (= lt!119867 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!119863 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!119867 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!74601 (= lt!119867 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!119862 () (_ BitVec 64))

(declare-fun lt!119868 () (_ BitVec 64))

(assert (=> b!74601 (= lt!119863 (bvsub lt!119862 lt!119868))))

(assert (=> b!74601 (or (= (bvand lt!119862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119868 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119862 lt!119868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74601 (= lt!119868 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!119865 () (_ BitVec 64))

(assert (=> b!74601 (= lt!119862 (bvadd (bvsub to!314 i!635) lt!119865))))

(assert (=> b!74601 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119865 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!119865) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74601 (= lt!119865 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!74602 () Bool)

(declare-fun res!61676 () Bool)

(assert (=> b!74602 (=> (not res!61676) (not e!48824))))

(assert (=> b!74602 (= res!61676 (invariant!0 (currentBit!3545 (_2!3335 lt!119869)) (currentByte!3550 (_2!3335 lt!119869)) (size!1425 (buf!1806 (_2!3335 lt!119869)))))))

(assert (= (and d!23674 res!61675) b!74599))

(assert (= (and b!74599 res!61673) b!74602))

(assert (= (and b!74602 res!61676) b!74601))

(assert (= (and b!74601 res!61674) b!74600))

(assert (= (and b!74600 res!61677) b!74598))

(declare-fun m!119583 () Bool)

(assert (=> b!74598 m!119583))

(declare-fun m!119585 () Bool)

(assert (=> b!74598 m!119585))

(declare-fun m!119587 () Bool)

(assert (=> b!74599 m!119587))

(declare-fun m!119589 () Bool)

(assert (=> b!74599 m!119589))

(declare-fun m!119591 () Bool)

(assert (=> d!23674 m!119591))

(declare-fun m!119593 () Bool)

(assert (=> b!74602 m!119593))

(assert (=> b!74511 d!23674))

(declare-fun b!74643 () Bool)

(declare-fun res!61716 () Bool)

(declare-fun e!48836 () Bool)

(assert (=> b!74643 (=> (not res!61716) (not e!48836))))

(declare-fun lt!119980 () tuple2!6444)

(assert (=> b!74643 (= res!61716 (isPrefixOf!0 (_2!3336 lt!119980) thiss!1379))))

(declare-fun b!74644 () Bool)

(declare-fun e!48835 () Unit!4927)

(declare-fun Unit!4931 () Unit!4927)

(assert (=> b!74644 (= e!48835 Unit!4931)))

(declare-fun d!23688 () Bool)

(assert (=> d!23688 e!48836))

(declare-fun res!61714 () Bool)

(assert (=> d!23688 (=> (not res!61714) (not e!48836))))

(assert (=> d!23688 (= res!61714 (isPrefixOf!0 (_1!3336 lt!119980) (_2!3336 lt!119980)))))

(declare-fun lt!119969 () BitStream!2424)

(assert (=> d!23688 (= lt!119980 (tuple2!6445 lt!119969 thiss!1379))))

(declare-fun lt!119967 () Unit!4927)

(declare-fun lt!119972 () Unit!4927)

(assert (=> d!23688 (= lt!119967 lt!119972)))

(assert (=> d!23688 (isPrefixOf!0 lt!119969 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2424 BitStream!2424 BitStream!2424) Unit!4927)

(assert (=> d!23688 (= lt!119972 (lemmaIsPrefixTransitive!0 lt!119969 thiss!1379 thiss!1379))))

(declare-fun lt!119970 () Unit!4927)

(declare-fun lt!119979 () Unit!4927)

(assert (=> d!23688 (= lt!119970 lt!119979)))

(assert (=> d!23688 (isPrefixOf!0 lt!119969 thiss!1379)))

(assert (=> d!23688 (= lt!119979 (lemmaIsPrefixTransitive!0 lt!119969 thiss!1379 thiss!1379))))

(declare-fun lt!119977 () Unit!4927)

(assert (=> d!23688 (= lt!119977 e!48835)))

(declare-fun c!5466 () Bool)

(assert (=> d!23688 (= c!5466 (not (= (size!1425 (buf!1806 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!119978 () Unit!4927)

(declare-fun lt!119981 () Unit!4927)

(assert (=> d!23688 (= lt!119978 lt!119981)))

(assert (=> d!23688 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23688 (= lt!119981 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!119965 () Unit!4927)

(declare-fun lt!119966 () Unit!4927)

(assert (=> d!23688 (= lt!119965 lt!119966)))

(assert (=> d!23688 (= lt!119966 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!119974 () Unit!4927)

(declare-fun lt!119976 () Unit!4927)

(assert (=> d!23688 (= lt!119974 lt!119976)))

(assert (=> d!23688 (isPrefixOf!0 lt!119969 lt!119969)))

(assert (=> d!23688 (= lt!119976 (lemmaIsPrefixRefl!0 lt!119969))))

(declare-fun lt!119964 () Unit!4927)

(declare-fun lt!119971 () Unit!4927)

(assert (=> d!23688 (= lt!119964 lt!119971)))

(assert (=> d!23688 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23688 (= lt!119971 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23688 (= lt!119969 (BitStream!2425 (buf!1806 thiss!1379) (currentByte!3550 thiss!1379) (currentBit!3545 thiss!1379)))))

(assert (=> d!23688 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23688 (= (reader!0 thiss!1379 thiss!1379) lt!119980)))

(declare-fun b!74645 () Bool)

(declare-fun res!61715 () Bool)

(assert (=> b!74645 (=> (not res!61715) (not e!48836))))

(assert (=> b!74645 (= res!61715 (isPrefixOf!0 (_1!3336 lt!119980) thiss!1379))))

(declare-fun b!74646 () Bool)

(declare-fun lt!119982 () Unit!4927)

(assert (=> b!74646 (= e!48835 lt!119982)))

(declare-fun lt!119968 () (_ BitVec 64))

(assert (=> b!74646 (= lt!119968 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119975 () (_ BitVec 64))

(assert (=> b!74646 (= lt!119975 (bitIndex!0 (size!1425 (buf!1806 thiss!1379)) (currentByte!3550 thiss!1379) (currentBit!3545 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3048 array!3048 (_ BitVec 64) (_ BitVec 64)) Unit!4927)

(assert (=> b!74646 (= lt!119982 (arrayBitRangesEqSymmetric!0 (buf!1806 thiss!1379) (buf!1806 thiss!1379) lt!119968 lt!119975))))

(assert (=> b!74646 (arrayBitRangesEq!0 (buf!1806 thiss!1379) (buf!1806 thiss!1379) lt!119968 lt!119975)))

(declare-fun b!74647 () Bool)

(declare-fun lt!119973 () (_ BitVec 64))

(declare-fun lt!119983 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2424 (_ BitVec 64)) BitStream!2424)

(assert (=> b!74647 (= e!48836 (= (_1!3336 lt!119980) (withMovedBitIndex!0 (_2!3336 lt!119980) (bvsub lt!119973 lt!119983))))))

(assert (=> b!74647 (or (= (bvand lt!119973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119983 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119973 lt!119983) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74647 (= lt!119983 (bitIndex!0 (size!1425 (buf!1806 thiss!1379)) (currentByte!3550 thiss!1379) (currentBit!3545 thiss!1379)))))

(assert (=> b!74647 (= lt!119973 (bitIndex!0 (size!1425 (buf!1806 thiss!1379)) (currentByte!3550 thiss!1379) (currentBit!3545 thiss!1379)))))

(assert (= (and d!23688 c!5466) b!74646))

(assert (= (and d!23688 (not c!5466)) b!74644))

(assert (= (and d!23688 res!61714) b!74645))

(assert (= (and b!74645 res!61715) b!74643))

(assert (= (and b!74643 res!61716) b!74647))

(declare-fun m!119619 () Bool)

(assert (=> b!74645 m!119619))

(assert (=> d!23688 m!119513))

(assert (=> d!23688 m!119513))

(declare-fun m!119621 () Bool)

(assert (=> d!23688 m!119621))

(declare-fun m!119623 () Bool)

(assert (=> d!23688 m!119623))

(declare-fun m!119625 () Bool)

(assert (=> d!23688 m!119625))

(assert (=> d!23688 m!119515))

(assert (=> d!23688 m!119513))

(assert (=> d!23688 m!119625))

(assert (=> d!23688 m!119515))

(declare-fun m!119627 () Bool)

(assert (=> d!23688 m!119627))

(declare-fun m!119629 () Bool)

(assert (=> d!23688 m!119629))

(declare-fun m!119631 () Bool)

(assert (=> b!74643 m!119631))

(assert (=> b!74646 m!119517))

(declare-fun m!119633 () Bool)

(assert (=> b!74646 m!119633))

(declare-fun m!119635 () Bool)

(assert (=> b!74646 m!119635))

(declare-fun m!119637 () Bool)

(assert (=> b!74647 m!119637))

(assert (=> b!74647 m!119517))

(assert (=> b!74647 m!119517))

(assert (=> b!74511 d!23688))

(declare-fun d!23694 () Bool)

(assert (=> d!23694 (= (invariant!0 (currentBit!3545 thiss!1379) (currentByte!3550 thiss!1379) (size!1425 (buf!1806 thiss!1379))) (and (bvsge (currentBit!3545 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3545 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3550 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3550 thiss!1379) (size!1425 (buf!1806 thiss!1379))) (and (= (currentBit!3545 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3550 thiss!1379) (size!1425 (buf!1806 thiss!1379)))))))))

(assert (=> b!74509 d!23694))

(declare-fun d!23696 () Bool)

(assert (=> d!23696 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1425 (buf!1806 thiss!1379))) ((_ sign_extend 32) (currentByte!3550 thiss!1379)) ((_ sign_extend 32) (currentBit!3545 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1425 (buf!1806 thiss!1379))) ((_ sign_extend 32) (currentByte!3550 thiss!1379)) ((_ sign_extend 32) (currentBit!3545 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5705 () Bool)

(assert (= bs!5705 d!23696))

(assert (=> bs!5705 m!119551))

(assert (=> b!74510 d!23696))

(declare-fun d!23698 () Bool)

(assert (=> d!23698 (= (array_inv!1271 (buf!1806 thiss!1379)) (bvsge (size!1425 (buf!1806 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!74508 d!23698))

(check-sat (not b!74598) (not d!23674) (not b!74602) (not b!74647) (not b!74643) (not b!74646) (not b!74645) (not b!74599) (not b!74539) (not d!23696) (not d!23654) (not b!74560) (not b!74537) (not d!23656) (not d!23688) (not d!23672))
